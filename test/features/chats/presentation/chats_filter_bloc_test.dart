import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat/chat.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_config/chat_config.dart';
import 'package:sinergy_hub/features/chat/domain/models/e_chat_filter.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/filter_chats_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/toggle_archive_chat_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/toggle_favorite_chat_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/watch_chats_use_case.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chats_filter_bloc/chats_filter_bloc.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';
import 'package:sinergy_hub/features/user/domain/usecases/get_current_user_data_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/listen_user_data_use_case.dart';

class MockWatchChatsUseCase extends Mock implements WatchChatsUseCase {}

class MockFilterChatsUseCase extends Mock implements FilterChatsUseCase {}

class MockToggleArchiveChatUseCase extends Mock
    implements ToggleArchiveChatUseCase {}

class MockToggleFavoriteChatUseCase extends Mock
    implements ToggleFavoriteChatUseCase {}

class MockGetCurrentUserDataUseCase extends Mock
    implements GetCurrentUserDataUseCase {}

class MockListenUserDataUseCase extends Mock implements ListenUserDataUseCase {}

void main() {
  late MockWatchChatsUseCase watchChatsUseCase;
  late MockFilterChatsUseCase filterChatsUseCase;
  late MockToggleArchiveChatUseCase toggleArchiveChatUseCase;
  late MockToggleFavoriteChatUseCase toggleFavoriteChatUseCase;
  late MockGetCurrentUserDataUseCase getCurrentUserDataUseCase;
  late MockListenUserDataUseCase listenUserDataUseCase;

  /// Cache-backed chat list stream handed out by the mocked watch use case;
  /// each test pushes the cached chats through it.
  late StreamController<List<Chat>> chatsController;

  /// Per-uid stream controllers handed out by the mocked use case so
  /// each test can push presence updates per user independently.
  late Map<String, StreamController<UserData?>> peerControllers;

  const currentUid = 'me';
  const peerA = 'peer-a';
  const peerB = 'peer-b';
  const peerC = 'peer-c';

  final currentUser = UserData.none().copyWith(uid: currentUid);

  Chat chatWithPeers(String chatId, List<String> participants) => Chat(
    chatId: chatId,
    participants: participants,
    lastMessageSent: DateTime(2026),
    createdAt: DateTime(2026),
    config: ChatConfig(),
  );

  ChatsFilterBloc buildBloc() => ChatsFilterBloc(
    watchChatsUseCase: watchChatsUseCase,
    filterChatsUseCase: filterChatsUseCase,
    toggleArchiveChatUseCase: toggleArchiveChatUseCase,
    toggleFavoriteChatUseCase: toggleFavoriteChatUseCase,
    getCurrentUserDataUseCase: getCurrentUserDataUseCase,
    listenUserDataUseCase: listenUserDataUseCase,
  );

  setUpAll(() {
    registerFallbackValue(EChatFilter.all);
    registerFallbackValue(<Chat>[]);
  });

  setUp(() {
    watchChatsUseCase = MockWatchChatsUseCase();
    filterChatsUseCase = MockFilterChatsUseCase();
    toggleArchiveChatUseCase = MockToggleArchiveChatUseCase();
    toggleFavoriteChatUseCase = MockToggleFavoriteChatUseCase();
    getCurrentUserDataUseCase = MockGetCurrentUserDataUseCase();
    listenUserDataUseCase = MockListenUserDataUseCase();

    chatsController = StreamController<List<Chat>>.broadcast();
    peerControllers = {};

    when(
      () => getCurrentUserDataUseCase.call(
        preferCache: any(named: 'preferCache'),
      ),
    ).thenAnswer((_) async => currentUser);

    when(() => watchChatsUseCase.call()).thenAnswer(
      (_) => chatsController.stream,
    );

    /// By default the filter passes the cached chats straight through, so
    /// the visible list equals what the cache emitted.
    when(
      () => filterChatsUseCase.call(
        chats: any(named: 'chats'),
        uid: any(named: 'uid'),
        filter: any(named: 'filter'),
        query: any(named: 'query'),
      ),
    ).thenAnswer(
      (invocation) => invocation.namedArguments[#chats] as List<Chat>,
    );

    when(() => listenUserDataUseCase.call(any())).thenAnswer((invocation) {
      final uid = invocation.positionalArguments.first as String;
      final controller = peerControllers.putIfAbsent(
        uid,
        () => StreamController<UserData?>.broadcast(),
      );
      return controller.stream;
    });
  });

  tearDown(() async {
    if (!chatsController.isClosed) await chatsController.close();
    for (final c in peerControllers.values) {
      if (!c.isClosed) await c.close();
    }
  });

  Future<void> waitUntil(bool Function() predicate) async {
    await Future.doWhile(() async {
      await Future<void>.delayed(Duration.zero);
      return !predicate();
    }).timeout(const Duration(seconds: 2));
  }

  /// Starts the bloc and pushes [chats] once the cache stream is listened to.
  Future<ChatsFilterBloc> initWith(List<Chat> chats) async {
    final bloc = buildBloc();
    bloc.add(const ChatsFilterEvent.init());
    await waitUntil(() => chatsController.hasListener);
    chatsController.add(chats);
    return bloc;
  }

  group('ChatsFilterBloc presence subscriptions', () {
    test(
      '_init subscribes to peer of every visible chat (excluding current user)',
      () async {
        final bloc = await initWith([
          chatWithPeers('c1', [currentUid, peerA]),
          chatWithPeers('c2', [currentUid, peerB]),
        ]);

        await waitUntil(
          () => bloc.state.peerSubs.length == 2,
        );

        expect(bloc.state.uid, currentUid);
        expect(bloc.state.peerSubs.keys, containsAll([peerA, peerB]));
        expect(bloc.state.peerSubs.containsKey(currentUid), isFalse);
        verify(() => listenUserDataUseCase.call(peerA)).called(1);
        verify(() => listenUserDataUseCase.call(peerB)).called(1);
        verify(
          () => getCurrentUserDataUseCase.call(preferCache: true),
        ).called(1);

        await bloc.close();
      },
    );

    test(
      'presence emission updates onlineStatuses for the matching peer',
      () async {
        final bloc = await initWith([
          chatWithPeers('c1', [currentUid, peerA]),
        ]);

        await waitUntil(() => bloc.state.peerSubs.containsKey(peerA));

        peerControllers[peerA]!.add(
          UserData.none().copyWith(uid: peerA, isOnline: true),
        );

        await waitUntil(
          () => bloc.state.onlineStatuses[peerA] == true,
        );
        expect(bloc.state.onlineStatuses[peerA], isTrue);

        /// Re-emit identical value: the equality guard prevents state churn.
        var emissionsAfter = 0;
        final sub = bloc.stream.listen((_) => emissionsAfter++);
        peerControllers[peerA]!.add(
          UserData.none().copyWith(uid: peerA, isOnline: true),
        );
        await Future<void>.delayed(const Duration(milliseconds: 50));
        expect(emissionsAfter, 0);

        await sub.cancel();
        await bloc.close();
      },
    );

    test(
      'applyFilter swap cancels orphaned subs and opens new ones',
      () async {
        final initial = chatWithPeers('c1', [currentUid, peerA]);
        final archived = chatWithPeers('c2', [currentUid, peerB]);

        when(
          () => filterChatsUseCase.call(
            chats: any(named: 'chats'),
            uid: any(named: 'uid'),
            filter: any(named: 'filter'),
            query: any(named: 'query'),
          ),
        ).thenAnswer((invocation) {
          final filter = invocation.namedArguments[#filter] as EChatFilter;
          return filter == EChatFilter.archived ? [archived] : [initial];
        });

        final bloc = await initWith([initial, archived]);
        await waitUntil(() => bloc.state.peerSubs.containsKey(peerA));
        expect(bloc.state.peerSubs.containsKey(peerB), isFalse);

        bloc.add(
          const ChatsFilterEvent.applyFilter(filter: EChatFilter.archived),
        );

        await waitUntil(
          () =>
              bloc.state.peerSubs.containsKey(peerB) &&
              !bloc.state.peerSubs.containsKey(peerA),
        );

        expect(bloc.state.filter, EChatFilter.archived);
        expect(bloc.state.chatsState.chats, [archived]);
        expect(peerControllers[peerA]!.hasListener, isFalse);
        expect(peerControllers[peerB]!.hasListener, isTrue);

        await bloc.close();
      },
    );

    test(
      'duplicate peer across chats subscribes only once',
      () async {
        final bloc = await initWith([
          chatWithPeers('c1', [currentUid, peerA]),
          chatWithPeers('c2', [currentUid, peerA]),
        ]);

        await waitUntil(() => bloc.state.peerSubs.containsKey(peerA));
        expect(bloc.state.peerSubs.length, 1);
        verify(() => listenUserDataUseCase.call(peerA)).called(1);

        await bloc.close();
      },
    );

    test(
      'cache stream delivering a brand new chat opens a sub for its peer',
      () async {
        final existing = chatWithPeers('c1', [currentUid, peerA]);
        final bloc = await initWith([existing]);
        await waitUntil(() => bloc.state.peerSubs.containsKey(peerA));

        chatsController.add([
          existing,
          chatWithPeers('c-new', [currentUid, peerC]),
        ]);

        await waitUntil(() => bloc.state.peerSubs.containsKey(peerC));
        expect(bloc.state.peerSubs.keys, containsAll([peerA, peerC]));
        expect(bloc.state.allChats, hasLength(2));

        await bloc.close();
      },
    );

    test(
      'bloc.close() cancels all remaining peer subscriptions',
      () async {
        final bloc = await initWith([
          chatWithPeers('c1', [currentUid, peerA]),
          chatWithPeers('c2', [currentUid, peerB]),
        ]);
        await waitUntil(
          () => bloc.state.peerSubs.length == 2,
        );

        await bloc.close();

        expect(peerControllers[peerA]!.hasListener, isFalse);
        expect(peerControllers[peerB]!.hasListener, isFalse);
        expect(chatsController.hasListener, isFalse);
      },
    );
  });
}

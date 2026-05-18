import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat/chat.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_config/chat_config.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_pg_state.dart/chat_pg_state.dart';
import 'package:sinergy_hub/features/chat/domain/models/e_chat_filter.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/listen_chat_updates_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/search_chats_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/toggle_archive_chat_use_case.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/toggle_favorite_chat_use_case.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chats_filter_bloc/chats_filter_bloc.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';
import 'package:sinergy_hub/features/user/domain/usecases/get_current_user_data_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/listen_user_data_use_case.dart';

class MockSearchChatsUseCase extends Mock implements SearchChatsUseCase {}

class MockToggleArchiveChatUseCase extends Mock
    implements ToggleArchiveChatUseCase {}

class MockToggleFavoriteChatUseCase extends Mock
    implements ToggleFavoriteChatUseCase {}

class MockListenChatUpdatesUseCase extends Mock
    implements ListenChatUpdatesUseCase {}

class MockGetCurrentUserDataUseCase extends Mock
    implements GetCurrentUserDataUseCase {}

class MockListenUserDataUseCase extends Mock implements ListenUserDataUseCase {}

void main() {
  late MockSearchChatsUseCase searchChatsUseCase;
  late MockToggleArchiveChatUseCase toggleArchiveChatUseCase;
  late MockToggleFavoriteChatUseCase toggleFavoriteChatUseCase;
  late MockListenChatUpdatesUseCase listenChatUpdatesUseCase;
  late MockGetCurrentUserDataUseCase getCurrentUserDataUseCase;
  late MockListenUserDataUseCase listenUserDataUseCase;

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
    searchChatsUseCase: searchChatsUseCase,
    toggleArchiveChatUseCase: toggleArchiveChatUseCase,
    toggleFavoriteChatUseCase: toggleFavoriteChatUseCase,
    listenChatUpdatesUseCase: listenChatUpdatesUseCase,
    getCurrentUserDataUseCase: getCurrentUserDataUseCase,
    listenUserDataUseCase: listenUserDataUseCase,
  );

  setUpAll(() {
    registerFallbackValue(const ChatPgState());
    registerFallbackValue(EChatFilter.all);
  });

  setUp(() {
    searchChatsUseCase = MockSearchChatsUseCase();
    toggleArchiveChatUseCase = MockToggleArchiveChatUseCase();
    toggleFavoriteChatUseCase = MockToggleFavoriteChatUseCase();
    listenChatUpdatesUseCase = MockListenChatUpdatesUseCase();
    getCurrentUserDataUseCase = MockGetCurrentUserDataUseCase();
    listenUserDataUseCase = MockListenUserDataUseCase();

    peerControllers = {};

    when(() => getCurrentUserDataUseCase.call())
        .thenAnswer((_) async => currentUser);

    when(
      () => listenChatUpdatesUseCase.call(),
    ).thenAnswer((_) => const Stream<Chat>.empty());

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

  group('ChatsFilterBloc presence subscriptions', () {
    test(
      '_init subscribes to peer of every visible chat (excluding current user)',
      () async {
        final chats = [
          chatWithPeers('c1', [currentUid, peerA]),
          chatWithPeers('c2', [currentUid, peerB]),
        ];
        when(
          () => searchChatsUseCase.call(
            chatState: any(named: 'chatState'),
            query: any(named: 'query'),
          ),
        ).thenAnswer(
          (_) async => ChatPgState(chats: chats),
        );

        final bloc = buildBloc();
        bloc.add(const ChatsFilterEvent.init());

        await waitUntil(
          () => bloc.state.peerSubs.length == 2,
        );

        expect(bloc.state.peerSubs.keys, containsAll([peerA, peerB]));
        expect(bloc.state.peerSubs.containsKey(currentUid), isFalse);
        verify(() => listenUserDataUseCase.call(peerA)).called(1);
        verify(() => listenUserDataUseCase.call(peerB)).called(1);

        await bloc.close();
      },
    );

    test(
      'presence emission updates onlineStatuses for the matching peer',
      () async {
        final chats = [
          chatWithPeers('c1', [currentUid, peerA]),
        ];
        when(
          () => searchChatsUseCase.call(
            chatState: any(named: 'chatState'),
            query: any(named: 'query'),
          ),
        ).thenAnswer(
          (_) async => ChatPgState(chats: chats),
        );

        final bloc = buildBloc();
        bloc.add(const ChatsFilterEvent.init());

        await waitUntil(() => bloc.state.peerSubs.containsKey(peerA));

        peerControllers[peerA]!.add(
          UserData.none().copyWith(uid: peerA, isOnline: true),
        );

        await waitUntil(
          () => bloc.state.onlineStatuses[peerA] == true,
        );
        expect(bloc.state.onlineStatuses[peerA], isTrue);

        // Re-emit identical value → equality guard, no spurious state churn.
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
        final initial = [chatWithPeers('c1', [currentUid, peerA])];
        final filtered = [chatWithPeers('c2', [currentUid, peerB])];

        var callIndex = 0;
        when(
          () => searchChatsUseCase.call(
            chatState: any(named: 'chatState'),
            query: any(named: 'query'),
            filter: any(named: 'filter'),
          ),
        ).thenAnswer((_) async {
          final result =
              callIndex == 0 ? initial : filtered;
          callIndex++;
          return ChatPgState(chats: result);
        });
        when(
          () => searchChatsUseCase.call(
            chatState: any(named: 'chatState'),
            query: any(named: 'query'),
          ),
        ).thenAnswer((_) async {
          final result =
              callIndex == 0 ? initial : filtered;
          callIndex++;
          return ChatPgState(chats: result);
        });

        final bloc = buildBloc();
        bloc.add(const ChatsFilterEvent.init());
        await waitUntil(() => bloc.state.peerSubs.containsKey(peerA));

        bloc.add(
          const ChatsFilterEvent.applyFilter(filter: EChatFilter.archived),
        );

        await waitUntil(
          () =>
              bloc.state.peerSubs.containsKey(peerB) &&
              !bloc.state.peerSubs.containsKey(peerA),
        );

        expect(peerControllers[peerA]!.hasListener, isFalse);
        expect(peerControllers[peerB]!.hasListener, isTrue);

        await bloc.close();
      },
    );

    test(
      'duplicate peer across chats subscribes only once',
      () async {
        final chats = [
          chatWithPeers('c1', [currentUid, peerA]),
          chatWithPeers('c2', [currentUid, peerA]),
        ];
        when(
          () => searchChatsUseCase.call(
            chatState: any(named: 'chatState'),
            query: any(named: 'query'),
          ),
        ).thenAnswer((_) async => ChatPgState(chats: chats));

        final bloc = buildBloc();
        bloc.add(const ChatsFilterEvent.init());

        await waitUntil(() => bloc.state.peerSubs.containsKey(peerA));
        expect(bloc.state.peerSubs.length, 1);
        verify(() => listenUserDataUseCase.call(peerA)).called(1);

        await bloc.close();
      },
    );

    test(
      'listenChatsChanges delivering a brand new chat opens a sub for its peer',
      () async {
        final controller = StreamController<Chat>.broadcast();
        addTearDown(() async {
          if (!controller.isClosed) await controller.close();
        });

        when(() => listenChatUpdatesUseCase.call())
            .thenAnswer((_) => controller.stream);

        when(
          () => searchChatsUseCase.call(
            chatState: any(named: 'chatState'),
            query: any(named: 'query'),
          ),
        ).thenAnswer(
          (_) async => ChatPgState(
            chats: [chatWithPeers('c1', [currentUid, peerA])],
          ),
        );

        final bloc = buildBloc();
        bloc.add(const ChatsFilterEvent.init());
        await waitUntil(() => bloc.state.peerSubs.containsKey(peerA));

        controller.add(chatWithPeers('c-new', [currentUid, peerC]));

        await waitUntil(() => bloc.state.peerSubs.containsKey(peerC));
        expect(bloc.state.peerSubs.keys, containsAll([peerA, peerC]));

        await bloc.close();
      },
    );

    test(
      'bloc.close() cancels all remaining peer subscriptions',
      () async {
        final chats = [
          chatWithPeers('c1', [currentUid, peerA]),
          chatWithPeers('c2', [currentUid, peerB]),
        ];
        when(
          () => searchChatsUseCase.call(
            chatState: any(named: 'chatState'),
            query: any(named: 'query'),
          ),
        ).thenAnswer((_) async => ChatPgState(chats: chats));

        final bloc = buildBloc();
        bloc.add(const ChatsFilterEvent.init());
        await waitUntil(
          () => bloc.state.peerSubs.length == 2,
        );

        await bloc.close();

        expect(peerControllers[peerA]!.hasListener, isFalse);
        expect(peerControllers[peerB]!.hasListener, isFalse);
      },
    );
  });
}

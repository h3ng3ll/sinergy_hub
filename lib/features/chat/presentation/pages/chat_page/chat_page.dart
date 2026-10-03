import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../domain/models/chat/chat.dart';
import '../../bloc/chat_page_bloc/chat_page_bloc.dart';
import 'widgets/app_bar/chat_app_bar.dart';
import 'widgets/build_chat_bottom/build_chat_bottom.dart';
import 'widgets/build_chat_canvas/build_chat_canvas.dart';
import 'widgets/skeleton/chat_page_skeleton.dart';

const Duration _kPageFade = Duration(milliseconds: 300);

class ChatPage extends StatefulWidget {
  final String chatId;

  const ChatPage({
    super.key,
    required this.chatId,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  late final ChatPageBloc _chatPageBloc;

  @override
  void initState() {
    _chatPageBloc = getIt<ChatPageBloc>()
      ..add(
        ChatPageEvent.init(
          chatId: widget.chatId,
        ),
      );
    _textEditingController.addListener(
      onTextUpdate,
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChatPage oldWidget) {
    if (oldWidget.chatId != widget.chatId) {
      /// on web widget still active and change if provided
      /// a new one
      _chatPageBloc.add(
        ChatPageEvent.init(
          chatId: widget.chatId,
        ),
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _chatPageBloc.close();
    _textEditingController.dispose();
    super.dispose();
  }

  void onTextUpdate() {
    _chatPageBloc.add(
      ChatPageEvent.startTyping(),
    );
  }

  void _onSendMessage() {
    if (_textEditingController.text.isEmpty) {
      return;
    }
    _chatPageBloc.add(
      ChatPageEvent.sendMessage(
        message: _textEditingController.text,
      ),
    );
    _textEditingController.clear();
  }

  void onAttachMedia() {}

  void onReachToEndMessages() {}

  void onTapUser(String userId) {
    final route = UserProfilePageRoute(
      userId: userId,
      chatId: widget.chatId,
    );
    kIsWeb
        ? route.go(
            context,
          )
        : route.push(
            context,
          );
  }

  void onTapUrl(String url) {
    launchUrl(
      Uri.parse(url),
    );
  }

  Future<void> onTapEmail(String email) async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else if (mounted) {
      UiMessageService.showError(
        AppLocalizations.of(context)!.could_not_launch_email,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _chatPageBloc,
      child: SafeArea(
        top: false,
        child: BlocBuilder<ChatPageBloc, ChatPageState>(
          builder: (context, chatPageState) {
            return AnimatedSwitcher(
              duration: _kPageFade,
              child: _buildPhase(chatPageState),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPhase(ChatPageState chatPageState) {
    if (chatPageState.isLoading) {
      return const ChatPageSkeleton(
        key: ValueKey('loading'),
      );
    }
    if (chatPageState.isFailed) {
      return Scaffold(
        key: const ValueKey('failed'),
        appBar: AppBar(),
        body: Center(
          child: Text(
            chatPageState.errorMessage,
          ),
        ),
      );
    }
    final Chat chat = chatPageState.chat!;

    /// Todo: refactor for grouped chats
    final UserData chatterUser = chatPageState.users.first;
    final UserData currentUser = chatPageState.userData!;

    /// "I blocked them" → the peer's uid is flagged in `blocked`.
    /// Drives the AppBar Block/Unblock toggle.
    final bool isPeerBlockedByMe = chat.isBlockedBy(chatterUser.uid);

    /// "They blocked me" → MY uid is flagged. Only this restricts the
    /// current user's input — the blocker is never locked out by
    /// their own action.
    final bool amIBlocked = chat.isBlockedBy(currentUser.uid);

    return Scaffold(
      key: const ValueKey('loaded'),
      appBar: ChatAppBar(
        onTapUser: () => onTapUser(
          chatterUser.uid,
        ),
        isBlocked: isPeerBlockedByMe,
        onToggleBlock: () => _chatPageBloc.add(
          ChatPageEvent.toggleBlock(
            targetUid: chatterUser.uid,
            blocked: !isPeerBlockedByMe,
          ),
        ),
        user: chatterUser,
      ),
      body: Column(
        children: [
          Expanded(
            child: BuildChatCanvas(
              currentUser: currentUser,
              onReachToEnd: onReachToEndMessages,
              chat: chat,
              users: [chatterUser],
              onTapUrl: onTapUrl,
              onTapEmail: onTapEmail,
            ),
          ),
          BuildChatBottom(
            onSendMessage: _onSendMessage,
            onAttachMedia: onAttachMedia,
            chatController: _textEditingController,
            isBlocked: amIBlocked,
          ),
        ],
      ),
    );
  }
}

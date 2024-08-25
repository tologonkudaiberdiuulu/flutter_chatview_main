import 'package:chatview/chatview.dart';
import 'package:example/data.dart';
import 'package:example/models/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Example());
}

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xffEE5366),
        colorScheme:
            ColorScheme.fromSwatch(accentColor: const Color(0xffEE5366)),
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  AppTheme theme = LightTheme();
  bool isDarkTheme = false;
  final _chatController = ChatController(
    initialMessageList: Data.messageList,
    scrollController: ScrollController(),
    currentUser: ChatUser(
      id: '1',
      name: 'Flutter',
      profilePhoto: Data.profileImage,
    ),
    otherUsers: [
      ChatUser(
        id: '2',
        name: 'Simform',
        profilePhoto: Data.profileImage,
      ),
      ChatUser(
        id: '3',
        name: 'Jhon',
        profilePhoto: Data.profileImage,
      ),
      ChatUser(
        id: '4',
        name: 'Mike',
        profilePhoto: Data.profileImage,
      ),
      ChatUser(
        id: '5',
        name: 'Rich',
        profilePhoto: Data.profileImage,
      ),
    ],
  );

  void _showHideTypingIndicator() {
    _chatController.setTypingIndicator = !_chatController.showTypingIndicator;
  }

  void receiveMessage() async {
    _chatController.addMessage(
      Message(
        id: DateTime.now().toString(),
        message: 'I will schedule the meeting.',
        createdAt: DateTime.now(),
        sentBy: '2',
      ),
    );
    await Future.delayed(const Duration(milliseconds: 500));
    _chatController.addReplySuggestions([
      const SuggestionItemData(text: 'Thanks.'),
      const SuggestionItemData(text: 'Thank you very much.'),
      const SuggestionItemData(text: 'Great.')
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat AppBar'),
      ),
      body: ChatView(
        profileCircleConfig: ProfileCircleConfiguration(
          profileImageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPCt0vSgeIE5IOZ6xV5qD4tDH4Wn3BrsO-3vFExuxd-UtTwyqaJ_pzCAwpTvmp4d5GLjA&usqp=CAU',
        ),
        featureActiveConfig: const FeatureActiveConfig(
          enableOtherUserProfileAvatar: true,
          enableOtherUserName: true,
          enableCurrentUserProfileAvatar: true,
          enableSwipeToSeeTime: true,
          messageTimePositionType: MessageTimePositionType.insideChatBubble,
        ),
        chatController: _chatController,
        onSendTap: _onSendTap,
        chatViewState: ChatViewState.hasMessages,
        chatViewStateConfig: const ChatViewStateConfiguration(
          noMessageWidgetConfig: ChatViewStateWidgetConfiguration(
            title: 'Нет сообщений',
          ),
        ),
        sendMessageConfig: SendMessageConfiguration(
          defaultSendButtonColor: const Color(0xff6330F4),
          allowRecordingVoice: false,
          enableCameraImagePicker: false,
          enableGalleryImagePicker: false,
          textFieldBackgroundColor: const Color(0xffF3F6F6),
          textFieldConfig: TextFieldConfiguration(
            onMessageTyping: (status) {
              debugPrint(status.toString());
            },
            compositionThresholdTime: const Duration(seconds: 1),
            textStyle: TextStyle(color: theme.textFieldTextColor),
          ),
        ),
        chatBackgroundConfig: const ChatBackgroundConfiguration(
          groupHeaderConfiguration: GroupHeaderConfiguration(
            todayText: 'today',
            yesterdayText: 'yesterday',
          ),
          sortEnable: true,
        ),
      ),
    );
  }

  void _onSendTap(
    String message,
    ReplyMessage replyMessage,
    MessageType messageType,
  ) {
    _chatController.addMessage(
      Message(
        id: DateTime.now().toString(),
        createdAt: DateTime.now(),
        message: message,
        sentBy: _chatController.currentUser.id,
        replyMessage: replyMessage,
        messageType: messageType,
      ),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      _chatController.initialMessageList.last.setStatus =
          MessageStatus.undelivered;
    });
    Future.delayed(const Duration(seconds: 1), () {
      _chatController.initialMessageList.last.setStatus = MessageStatus.read;
    });
  }

  void _onThemeIconTap() {
    setState(() {
      if (isDarkTheme) {
        theme = LightTheme();
        isDarkTheme = false;
      } else {
        theme = DarkTheme();
        isDarkTheme = true;
      }
    });
  }
}

import 'package:chatview/chatview.dart';

class Data {
  static const profileImage =
      "https://raw.githubusercontent.com/SimformSolutionsPvtLtd/flutter_showcaseview/master/example/assets/simform.png";
  static final messageList = [
    Message(
      id: '1',
      message: "Hi!",
      createdAt: DateTime.parse('2024-08-21T18:59:02'),
      // createdAt: DateTime.now().subtract(const Duration(days: 3)),
      sentBy: '1', // userId of who sends the message
      status: MessageStatus.read,
    ),
    Message(
      id: '1',
      message: "It's test message",
      createdAt: DateTime.parse('2024-08-21T19:25:02'),
      // createdAt: DateTime.now().subtract(const Duration(days: 3)),
      sentBy: '1', // userId of who sends the message
      status: MessageStatus.read,
    ),
    // Message(
    //   id: '2',
    //   message: "Hi!",
    //   createdAt: DateTime.now(),
    //   sentBy: '2',
    //   status: MessageStatus.read,
    // ),
    // Message(
    //   id: '3',
    //   message: "We can meet?I am free",
    //   createdAt: DateTime.now(),
    //   sentBy: '1',
    //   status: MessageStatus.read,
    // ),
    // Message(
    //   id: '4',
    //   message: "Can you write the time and place of the meeting?",
    //   createdAt: DateTime.now(),
    //   sentBy: '1',
    //   status: MessageStatus.read,
    // ),
    // Message(
    //   id: '5',
    //   message: "That's fine",
    //   createdAt: DateTime.now(),
    //   sentBy: '2',
    //   status: MessageStatus.read,
    // ),
    Message(
      id: '6',
      message: "When to go ?",
      createdAt: DateTime.parse('2024-08-21T19:06:29'),
      // createdAt: DateTime.now(),
      sentBy: '3',
      status: MessageStatus.read,
    ),
    Message(
      id: '7',
      message: "I guess Simform will reply",
      createdAt: DateTime.parse('2024-08-24T22:31:38'),
      sentBy: '1',
      // sentBy: '4',
      status: MessageStatus.read,
    ),
    // Message(
    //   id: '8',
    //   message: "https://bit.ly/3JHS2Wl",
    //   createdAt: DateTime.now(),
    //   sentBy: '2',
    //   status: MessageStatus.read,
    // ),
    // Message(
    //   id: '9',
    //   message: "Done",
    //   createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    //   sentBy: '1',
    //   status: MessageStatus.read,
    // ),
    Message(
      id: '10',
      message: "Thank you!!",
      status: MessageStatus.read,
      createdAt: DateTime.parse('2024-08-25T19:22:56'),
      // createdAt: DateTime.now().subtract(const Duration(days: 2)),
      sentBy: '1',
    ),
    // Message(
    //   id: '11',
    //   message: "https://miro.medium.com/max/1000/0*s7of7kWnf9fDg4XM.jpeg",
    //   createdAt: DateTime.now(),
    //   messageType: MessageType.image,
    //   sentBy: '1',
    //   status: MessageStatus.read,
    // ),
    // Message(
    //   id: '12',
    //   message: "🤩🤩",
    //   createdAt: DateTime.now(),
    //   sentBy: '2',
    //   status: MessageStatus.read,
    // ),
  ];
}

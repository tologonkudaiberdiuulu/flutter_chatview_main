/*
 * Copyright (c) 2022 Simform Solutions
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import 'package:flutter/material.dart';

import 'package:chatview/src/extensions/extensions.dart';
import 'package:chatview/src/models/models.dart';

import '../utils/constants/constants.dart';
import '../values/typedefs.dart';
import 'link_preview.dart';

class TextMessageView extends StatelessWidget {
  const TextMessageView({
    Key? key,
    required this.isMessageBySender,
    required this.message,
    this.chatBubbleMaxWidth,
    this.inComingChatBubbleConfig,
    this.outgoingChatBubbleConfig,
    this.messageReactionConfig,
    this.highlightMessage = false,
    this.highlightColor,
    this.messageDateTimeBuilder,
    this.messageTimeTextStyle,
    this.chatUser,
    this.senderNameTextStyle,
  }) : super(key: key);

  /// Represents current message is sent by current user.
  final bool isMessageBySender;

  /// Provides message instance of chat.
  final Message message;

  /// Allow users to give max width of chat bubble.
  final double? chatBubbleMaxWidth;

  /// Provides configuration of chat bubble appearance from other user of chat.
  final ChatBubble? inComingChatBubbleConfig;

  /// Provides configuration of chat bubble appearance from current user of chat.
  final ChatBubble? outgoingChatBubbleConfig;

  /// Provides configuration of reaction appearance in chat bubble.
  final MessageReactionConfiguration? messageReactionConfig;

  /// Represents message should highlight.
  final bool highlightMessage;

  /// Allow user to set color of highlighted message.
  final Color? highlightColor;

  /// Allow user to set custom formatting of message time.
  final MessageDateTimeBuilder? messageDateTimeBuilder;

  /// Used to give text style of message's time of a chat bubble
  final TextStyle? messageTimeTextStyle;

  final ChatUser? chatUser;

  final TextStyle? senderNameTextStyle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textMessage = message.message;
    return Container(
      constraints: BoxConstraints(
        maxWidth: chatBubbleMaxWidth ?? MediaQuery.sizeOf(context).width * 0.75,
        minWidth: MediaQuery.sizeOf(context).width * .3,
      ),
      padding: _padding ??
          const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
      margin: _margin ??
          EdgeInsets.fromLTRB(
              5, 0, 6, message.reaction.reactions.isNotEmpty ? 15 : 2),
      decoration: BoxDecoration(
        color: highlightMessage ? highlightColor : _color,
        borderRadius: _borderRadius(textMessage),
      ),
      child: textMessage.isUrl
          ? LinkPreview(
              linkPreviewConfig: _linkPreviewConfig,
              url: textMessage,
              message: message,
              isMessageBySender: isMessageBySender,
            )
          : IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        chatUser?.name ?? '',
                        style: senderNameTextStyle ??
                            TextStyle(
                              fontWeight: FontWeight.w800,
                              color: isMessageBySender
                                  ? Colors.white
                                  : Colors.black,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    textMessage,
                    style: _textStyle ??
                        textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color:
                              isMessageBySender ? Colors.white : Colors.black,
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateTime.now().getTimeFromDateTime,
                        style: TextStyle(
                          color: isMessageBySender
                              ? Colors.grey.shade400
                              : Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }

  EdgeInsetsGeometry? get _padding => isMessageBySender
      ? outgoingChatBubbleConfig?.padding
      : inComingChatBubbleConfig?.padding;

  EdgeInsetsGeometry? get _margin => isMessageBySender
      ? outgoingChatBubbleConfig?.margin
      : inComingChatBubbleConfig?.margin;

  LinkPreviewConfiguration? get _linkPreviewConfig => isMessageBySender
      ? outgoingChatBubbleConfig?.linkPreviewConfig
      : inComingChatBubbleConfig?.linkPreviewConfig;

  TextStyle? get _textStyle => isMessageBySender
      ? outgoingChatBubbleConfig?.textStyle
      : inComingChatBubbleConfig?.textStyle;

  BorderRadiusGeometry _borderRadius(String message) => isMessageBySender
      ? outgoingChatBubbleConfig?.borderRadius ??
          const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          )
      : inComingChatBubbleConfig?.borderRadius ??
          const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          );

  Color get _color => isMessageBySender
      ? outgoingChatBubbleConfig?.color ?? const Color(0xFF6330F4)
      : inComingChatBubbleConfig?.color ?? const Color(0xFFF2F7FB);
}

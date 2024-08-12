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
import 'package:chatview/src/utils/package_strings.dart';
import 'package:flutter/material.dart';
import 'package:chatview/src/models/models.dart';
import 'package:chatview/src/extensions/extensions.dart';

import '../utils/constants/constants.dart';

class ChatGroupHeader extends StatelessWidget {
  const ChatGroupHeader({
    Key? key,
    required this.day,
    this.groupSeparatorConfig,
    this.groupHeaderConfig,
  }) : super(key: key);

  /// Provides day of started chat.
  final DateTime day;

  /// Provides configuration for separator upon date wise chat.
  final DefaultGroupSeparatorConfiguration? groupSeparatorConfig;

  /// Provides configuration for separator upon date wise chat.
  final GroupHeaderConfiguration? groupHeaderConfig;

  @override
  Widget build(BuildContext context) {
    String dayHeader = day.getDay(
      groupSeparatorConfig?.chatSeparatorDatePattern ??
          defaultChatSeparatorDatePattern,
    );
    if (dayHeader == PackageStrings.today &&
        groupHeaderConfig?.todayText != null) {
      dayHeader = groupHeaderConfig!.todayText!;
    } else if (dayHeader == PackageStrings.yesterday &&
        groupHeaderConfig?.yesterdayText != null) {
      dayHeader = groupHeaderConfig!.yesterdayText!;
    }
    return Padding(
      padding: groupSeparatorConfig?.padding ??
          const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        dayHeader,
        textAlign: TextAlign.center,
        style: groupSeparatorConfig?.textStyle ?? const TextStyle(fontSize: 17),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../apptheme/color_theme.dart';

class TimerTile extends StatelessWidget {
  const TimerTile({
    Key? key,
    required this.settingsTextStyle,
    this.title,
    this.selectedTime,
    this.widget,
  }) : super(key: key);

  final TextStyle settingsTextStyle;
  final String? title;
  final String? selectedTime;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 5,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        tileColor: ColorTheme.deepRedColor,
        title: Text(
          title!,
          style: settingsTextStyle,
        ),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            selectedTime ?? "",
            style: settingsTextStyle,
          ),
          const SizedBox(
            width: 10,
          ),
          widget!
        ]),
      ),
    );
  }
}

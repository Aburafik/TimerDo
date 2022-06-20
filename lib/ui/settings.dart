import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/apptheme/color_theme.dart';
import 'package:timer_app/providers/timer_provider.dart';

import '../resources/widgets/custome_timer_tile.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextStyle settingsTextStyle =
      const TextStyle(fontSize: 16, color: Color.fromARGB(255, 225, 205, 205));
  bool isSwcitch = false;
  bool autoStartSwcitch = false;

  @override
  Widget build(BuildContext context) {
    int _timer = Provider.of<Timer>(context).initiaTimer;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Timers",
              style: settingsTextStyle,
            ),
          ),
          TimerTile(
            settingsTextStyle: settingsTextStyle,
            title: "Normal",
            selectedTime: "$_timer minutes",
            inCreaeTimerWidgetwidget: GestureDetector(
              onTap: Provider.of<Timer>(context, listen: true).setInCreasetimer,
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 15,
              ),
            ),
            decrereesTimerWidget: GestureDetector(
              onTap: Provider.of<Timer>(context, listen: true).setDecreasetimer,
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
          TimerTile(
            settingsTextStyle: settingsTextStyle,
            title: "Short Break",
            selectedTime: "5 min",
            inCreaeTimerWidgetwidget: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 15, bottom: 10),
            child: Text(
              "LONG BREAK",
              style: settingsTextStyle,
            ),
          ),
          TimerTile(
            settingsTextStyle: settingsTextStyle,
            title: "Long Break",
            // selectedTime: "5min",
            inCreaeTimerWidgetwidget: Switch(
              activeColor: ColorTheme.switchActiveColor,
              value: isSwcitch,
              onChanged: (values) {
                setState(() {
                  isSwcitch = values;
                });
              },
            ),
          ),
          TimerTile(
            settingsTextStyle: settingsTextStyle,
            title: "Long Break Length",
            selectedTime: "15min",
            inCreaeTimerWidgetwidget: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15,
            ),
          ),
          TimerTile(
            settingsTextStyle: settingsTextStyle,
            title: "Long Break After",
            selectedTime: "5 working session",
            inCreaeTimerWidgetwidget: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15,
            ),
          ),
          TimerTile(
            settingsTextStyle: settingsTextStyle,
            title: "Auto Start Break",
            // selectedTime: "5",
            inCreaeTimerWidgetwidget: Switch(
              activeColor: ColorTheme.switchActiveColor,
              value: autoStartSwcitch,
              onChanged: (values) {
                setState(() {
                  autoStartSwcitch = values;
                });
              },
            ),
          ),
          Expanded(
              child: Container(
            color: const Color(0xffF63547),
          ))
        ],
      ),
    );
  }
}

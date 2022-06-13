import 'package:flutter/material.dart';
import 'package:timer_app/apptheme/color_theme.dart';

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
            selectedTime: "25 min",
            widget: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15,
            ),
          ),
          TimerTile(
            settingsTextStyle: settingsTextStyle,
            title: "Short Break",
            selectedTime: "5 min",
            widget: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 15,bottom: 10),
            child: Text(
              "LONG BREAK",
              style: settingsTextStyle,
            ),
          ),
          TimerTile(
            settingsTextStyle: settingsTextStyle,
            title: "Long Break",
            // selectedTime: "5min",
            widget: Switch(
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
            widget: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15,
            ),
          ),
          TimerTile(
            settingsTextStyle: settingsTextStyle,
            title: "Long Break After",
            selectedTime: "5 working session",
            widget: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15,
            ),
          ),
          TimerTile(
            settingsTextStyle: settingsTextStyle,
            title: "Auto Start Break",
            // selectedTime: "5",
            widget: Switch(
              activeColor: ColorTheme.switchActiveColor,
              value: autoStartSwcitch,
              onChanged: (values) {
                setState(() {
                  autoStartSwcitch = values;
                });
              },
            ),
          ),
          Expanded(child: Container(
            color: Color(0xffF63547),))
        ],
      ),
    );
  }
}

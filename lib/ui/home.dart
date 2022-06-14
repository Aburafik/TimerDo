import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:timer_app/apptheme/color_theme.dart';
import 'package:timer_app/ui/settings.dart';
import 'package:timer_app/ui/statisticts.dart';

double _counter = 0;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isStarted = false;
  final _stopWatchTimer = StopWatchTimer(
    onChange: (value) {},
    onChangeRawSecond: (value) {
      _counter += 0.0007;
    },
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  @override
  void initState() {
    super.initState();
  }

  startTimer() {
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    setState(() {
      isStarted = true;
    });
  }

  //Start timer
  stopTimer() {
    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
    setState(() {
      isStarted = false;
    });
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StatisticsView()));
                },
                icon: const Icon(Icons.bar_chart))
          ]),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "STAY FOCUSED",
            ),
            const SizedBox(
              height: 25,
            ),
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: 0,
              builder: (context, snap) {
                final value = snap.data;
                final displayTime = StopWatchTimer.getDisplayTime(value!,
                    hours: false, milliSecond: false);
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: CircularPercentIndicator(
                          backgroundWidth: 5,
                          radius: 120.0,
                          lineWidth: 5.0,
                          percent: _counter,
                          center: Text(
                            displayTime,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 55, fontWeight: FontWeight.bold),
                          ),
                          progressColor: ColorTheme.whiteColor,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          color: ColorTheme.whiteColor,
                          onPressed: () =>
                              isStarted ? stopTimer() : startTimer(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              isStarted ? "STOP TIMERDO" : "START TIMERDO",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      color: ColorTheme.buttonTextColor,
                                      fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:timer_app/apptheme/color_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Timer? _timer;
  int _start = 25;
  double counter = 0.0;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
            counter += 0.01;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.bar_chart))
          ]),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "STAY FOCUSED",
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 5.0,
                percent: counter,
                center: Text("$_start"),
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
                onPressed: () {
                  startTimer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "START TIMERDO",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: ColorTheme.buttonTextColor, fontSize: 20),
                  ),
                ),
              ),
            ),
            Spacer(),
            Spacer()
          ],
        ),
      ),
    );
  }
}

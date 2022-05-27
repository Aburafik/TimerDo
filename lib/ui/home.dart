import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:timer_app/apptheme/color_theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
            ),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.bar_chart))]),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text("STAY FOCUSED"),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: new CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 5.0,
                percent: 1.0,
                center: Text("25:00"),
                progressColor: ColorTheme.whiteColor,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: ColorTheme.whiteColor,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "START TIMERDO",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: ColorTheme.buttonTextColor, fontSize: 25),
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

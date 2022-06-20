import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/apptheme/color_theme.dart';
import 'package:timer_app/providers/timer_provider.dart';
import 'package:timer_app/ui/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int setTimer = Provider.of<Timer>(context).initiaTimer;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        ColorTheme.primaryColor,
        ColorTheme.semiPrimaryColor,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Enjoy making plans and stay focused!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: GestureDetector(
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: ColorTheme.whiteColor,
                  child: Icon(
                    Icons.arrow_forward,
                    size: 35,
                    color: ColorTheme.buttonTextColor,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Home(timer: setTimer,)));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

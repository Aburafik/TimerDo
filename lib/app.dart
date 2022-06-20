import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/apptheme/app_theme.dart';
import 'package:timer_app/providers/timer_provider.dart';
import 'package:timer_app/ui/splash_screen.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart'; 
// Import stop_watch_timer

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Timer(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        home:const SplashScreen(),
      ),
    );
  }
}

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  // final StopWatchTimer _stopWatchTimer = StopWatchTimer(); // Create instance.

  final _stopWatchTimer = StopWatchTimer(
    onChange: (value) {
      final displayTime = StopWatchTimer.getDisplayTime(value);
      print('displayTime $displayTime');
    },
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  @override
  void initState() {
    super.initState();
    // Start
    // _stopWatchTimer.onExecute.add(StopWatchExecute.start);

    // _stopWatchTimer
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      
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
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    displayTime,
                    style:const TextStyle(
                        fontSize: 40,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    value.toString(),
                    style:const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                    },
                    child:const Text("Start")),
                TextButton(
                    onPressed: () {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                    },
                    child:const Text("Stop")),
              ],
            ),
          );
        },
      ),
    );
  }
}

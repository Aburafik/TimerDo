import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/providers/timer_provider.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int value = Provider.of<Timer>(context).initiaTimer;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Statistics"),
      ),
    );
  }
}

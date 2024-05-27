import 'package:flutter/material.dart';
import 'package:semara_app/utils.dart';

class DailyRoutines extends StatefulWidget {
  const DailyRoutines({super.key});

  @override
  State<DailyRoutines> createState() => _DailyRoutinesState();
}

class _DailyRoutinesState extends State<DailyRoutines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: turbo300,
      body: Container(
        child: Text("ini page daily routines"),
      ),
    );
  }
}

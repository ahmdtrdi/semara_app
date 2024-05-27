import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:semara_app/utils.dart';
import 'package:semara_app/view/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const Onboarding()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          color: turbo50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/semaralogo.png",
                width: double.infinity,
              ),
            ],
          ),
        ),
        Positioned(
          top: 584,
          left: 60,
          bottom: 131,
          child: Text(
            "SEMARA",
            style: mobileh1p,
          ),
        ),
        Positioned(
          top: 690,
          left: 105,
          child: Text(
            "Senja Emas Rahayu",
            style: mobileH5,
          ),
        )
      ]),
    );
  }
}

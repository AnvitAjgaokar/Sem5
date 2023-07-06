import 'package:flutter/material.dart';
import 'package:sem5demo1/onboarding/onboardingscreen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,

  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Onboarding Example';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,


    home: OnBoardingPage(),
  );
}
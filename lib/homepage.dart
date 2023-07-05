import 'package:flutter/material.dart';
import 'package:sem5demo1/main.dart';
import 'package:sem5demo1/onboarding/onboardingscreen.dart';
import 'package:button_widget/button_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(MyApp.title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'HomePage',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ElevatedButtonW(
            buttonText: "Go Back",
            ontap: () => goToOnBoarding(context),


          ),
        ],
      ),
    ),
  );

  void goToOnBoarding(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => OnBoardingPage()),
  );
}
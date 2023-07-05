import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:sem5demo1/homepage.dart';

import '../signupin/sigin.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});



  @override
  Widget build(BuildContext context) => Scaffold(

    body: Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 30),
      child: IntroductionScreen(

        pages: [
          PageViewModel(
            image: buildImage('assets/images/firston.jpg'),

            title: 'Find Parking Places Around You Easily',
            body: 'Easily find parking places around you with our convenient solution.Discover parking spots near you effortlessly using our user-friendly system.Quickly locate accessible parking spots around you through our efficient tool.'

            ,

            decoration: getPageDecoration(),
          ),
          PageViewModel(
            image: buildImage('assets/images/secononcop.jpg'),

            title: 'Book and Pay Parking Quickly & Easily ',
            body: 'Book parking spaces effortlessly and complete your payment swiftly using our platform.'
            'Our user-friendly system allows you to easily book and make payments for parking in no time.'
            'Book parking spaces effortlessly and complete your payment swiftly using our platform.'
            ,

            decoration: getPageDecoration(),

          ),

          PageViewModel(
            image: buildImage('assets/images/thirdonnew.jpg'),

            title: 'Select Parking Time As You Need',
            body: 'Take control of your parking schedule by choosing the specific time you need through our user-friendly system.'
                'Easily adjust and select your desired parking time to fit your plans effortlessly'
            'Customize your parking time according to your needs with our flexible selection options'
            ,

            decoration: getPageDecoration(),

          ),

        ],

        showSkipButton: true,

        skip: Text('Skip', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent.shade700)) ,
        onSkip: () => goTosigin(context),

        // showDoneButton: false,
        done: Text('Done', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent.shade700)),
        onDone: () =>  goTosigin(context),

        showNextButton: false,
        dotsDecorator: getDotDecoration(),
        onChange: (index) => print('Page $index selected'),
        dotsFlex: 2,
        globalBackgroundColor: Colors.white,

        // skipOrBackFlex: 0,
        // nextFlex: 0,


      ),
    ),
  );

  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => HomePage()),
  );
  
  void goTosigin(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => SignInPage())
  );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Colors.blue.shade100,
    activeColor: Colors.blueAccent.shade700,
    // size: Size(10, 10),

  );

  PageDecoration getPageDecoration() => const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 14),
    bodyPadding: EdgeInsets.only(left: 5,right: 5),

    imagePadding: EdgeInsets.all(20),
    imageFlex: 2,
    pageColor: Colors.white,

  );
}

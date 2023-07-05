

import 'package:flutter/material.dart';
import 'package:sem5demo1/onboarding/onboardingscreen.dart';

import '../homepage.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(

        leading: IconButton(onPressed: () => goOnboard(context),
          icon: Icon(Icons.arrow_back), color: Colors.black,),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,

      ),

      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 0),
        alignment: Alignment.centerLeft,

        child: Column(

          children:[
            const SizedBox(height: 85,),

            const Text("Create your\n Account",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45),),

            const SizedBox(height: 70,),

            Container(
              padding: EdgeInsets.only(left: 20,right: 20,),
              height: 45,
              child: // Note: Same code is applied for the TextFormField as well
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0, color: Colors.grey.shade200), //<-- SEE HERE
                  ),

                ),

              )

            ),
            const SizedBox(height: 15,),

            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              height: 45,
              child: OutlinedButton(onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(image: AssetImage("assets/logos/newgoogle.jpg"), width: 25,height: 35,),
                      SizedBox(width: 10,),
                      Text("Continue with Google",style: TextStyle(color: Colors.black),)
                    ],
                  )),
            ),
            const SizedBox(height: 15,),




            const SizedBox(height: 30,),

            // Divider(
            //   indent: 30,
            //   endIndent: 30,
            //   color: Colors.grey.shade400,
            //   thickness: 1,
            // ),
            //
            // Text("or",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.grey.shade600),),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Divider(
                        color: Colors.grey.shade400,
                        indent: 30,
                        thickness: 1,
                        endIndent: 10,
                      )
                  ),

                  Text("or",style: TextStyle(fontSize: 13,color: Colors.grey.shade600,fontWeight: FontWeight.bold),),

                  Expanded(
                      child: Divider(
                        color: Colors.grey.shade400,
                        endIndent: 30,
                        thickness: 1,
                        indent: 10,
                      )
                  ),
                ]
            ),

            const SizedBox(height: 40,),

            Container(
              width: double.infinity,
              height: 45,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Sign in with password'),
                style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Colors.blueAccent.shade700,elevation: 9,),
              ),
            ),

            const SizedBox(height: 60,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: TextStyle(fontSize: 13,color: Colors.grey),),
                // SizedBox(width: 1,),
                TextButton(onPressed: () {}, child: Text("Sign up", style: TextStyle(fontSize: 13,color: Colors.blueAccent.shade700),))
              ],
            ),

          ],
        ),
      ),

    );
  }

  void goOnboard(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => OnBoardingPage()),
  );

}


import 'package:flutter/material.dart';
import 'package:sem5demo1/homepage.dart';
import 'package:sem5demo1/signupin/createaccount.dart';
import 'package:sem5demo1/signupin/sigin.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool isPasswordVisible = false;
  bool isPasswordValid = false;
  bool isEmailValid = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(

        leading: IconButton(onPressed: () => goSigin(context),
          icon: Icon(Icons.arrow_back), color: Colors.black,),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,

      ),

      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 0),
        // alignment: Alignment.centerLeft,


        child: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: _formKey,
            child: Column(

              children:[
                const SizedBox(height: 40,),

                Container(padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: const Text("Login to your\nAccount",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45),)),

                const SizedBox(height: 50,),

                Container(
                    padding: EdgeInsets.only(left: 20,right: 20,),
                    height: 45,
                    child:
                    // Note: Same code is applied for the TextFormField as well
                    TextField(
                      controller: _emailController,
                      onChanged: validateEmail,
                      decoration: InputDecoration(

                        prefixIcon: Icon(Icons.mail_rounded,color: Colors.grey.shade600,),
                        // helperText: "Email",
                        // helperStyle: TextStyle(color: Colors.grey.shade400),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 14),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        // focusColor: Colors.blueAccent.shade700,


                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0, color: Colors.grey.shade100,

                            ),
                            borderRadius: BorderRadius.circular(10)//<-- SEE HERE
                        ),

                      ),

                    )

                ),
                const SizedBox(height: 15,),

                Container(
                    padding: EdgeInsets.only(left: 20,right: 20,),
                    height: 45,
                    child:
                    // Note: Same code is applied for the TextFormField as well
                    TextField(
                      obscureText: !isPasswordVisible,
                      controller: _passwordController,
                      onChanged: validatePassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock,color: Colors.grey.shade600,),
                        suffixIcon: IconButton(onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                          icon:  Icon(
                            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),

                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 14),
                        filled: true,
                        fillColor: Colors.grey.shade200,


                        // focusColor: Colors.blueAccent.shade700,

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0, color: Colors.grey.shade100,

                          ),
                          borderRadius: BorderRadius.circular(10),
                          //<-- SEE HERE
                        ),

                      ),

                    )

                ),
                const SizedBox(height: 10,),




                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      Checkbox(
                        side: BorderSide(color: Colors.blueAccent.shade700,width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          // side: BorderSide(color: Colors.blueAccent.shade700),


                        ),
                        value: rememberMe,
                        activeColor: Colors.blueAccent.shade700,
                        checkColor: Colors.white,
                        onChanged: (newValue) {
                          setState(() {
                            rememberMe = newValue ?? false;
                          });
                        },
                      ),
                      const SizedBox(width: 0),

                      const Text(
                        'Remember me',
                        style: TextStyle(fontSize: 14,color: Colors.black),
                      ),
                    ],
                  ),
                ),



                const SizedBox(height: 10,),

                Container(
                  width: double.infinity,
                  height: 45,
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _submitForm();

                    },
                    child: Text('Login',style: TextStyle(fontSize: 15),),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Colors.blueAccent.shade700,elevation: 9,),
                  ),
                ),

                const SizedBox(height: 60,),

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

                      Text("or continue with",style: TextStyle(fontSize: 13,color: Colors.grey.shade600,fontWeight: FontWeight.bold),),

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

                const SizedBox(height: 30,),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 70,
                        height: 50,
                        child: OutlinedButton(onPressed: () {},

                            child: Image(image: AssetImage("assets/logos/newface.jpg"), width: 20,height: 30,)),
                      ),


                      SizedBox(width: 20,),

                      Container(
                        width: 70,
                        height: 50,
                        child: OutlinedButton(onPressed: () {},
                            child: Image(image: AssetImage("assets/logos/newgoogle.jpg"), width: 20,height: 30,)),
                      ),
                      SizedBox(width: 20,),

                      Container(
                        width: 70,
                        height: 50,
                        child: OutlinedButton(onPressed: () {},
                            child: Image(image: AssetImage("assets/logos/newapple.jpg"), width: 20,height: 30,)),
                      ),

                    ]
                ),


                const SizedBox(height: 30,),



                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(fontSize: 13,color: Colors.grey),),
                    // SizedBox(width: 1,),
                    TextButton(onPressed: () {goSigup(context);}, child: Text("Sign up", style: TextStyle(fontSize: 13,color: Colors.blueAccent.shade700),))
                  ],
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }

  void goSigup(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const SignUpPage()),
  );

  void goSigin(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const SignInPage()),
  );

  void goHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) =>  HomePage()),
  );

  void validatePassword(String? value) {
    if (value != null && value.length >= 8 && value.contains(RegExp(r'[0-9]')) && value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      setState(() {
        isPasswordValid = true;
      });
    } else {
      setState(() {
        isPasswordValid = false;
      });
    }
  }

  void validateEmail(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        value.contains('@') &&
        value.contains('.') &&
        !value.startsWith('@') &&
        !value.endsWith('@') &&
        !value.startsWith('.') &&
        !value.endsWith('.')) {
      setState(() {
        isEmailValid = true;
      });
    } else {
      setState(() {
        isEmailValid = false;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (isEmailValid && isPasswordValid) {
        goHome(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green.shade100,
            duration: Duration(seconds: 3),
            showCloseIcon: true,
            closeIconColor: Colors.white,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'Congratulations',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Account created Successfully!!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green.shade400,
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (!isEmailValid && !isPasswordValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red.shade100,
            duration: Duration(seconds: 3),
            showCloseIcon: true,
            closeIconColor: Colors.white,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'Fields cannot be Empty!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter a Valid Email Address and Password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red.shade400,
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (!isPasswordValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red.shade100,
            duration: Duration(seconds: 3),
            showCloseIcon: true,
            closeIconColor: Colors.white,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'Invalid Password!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter a Password with atleast one special character and digit',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red.shade400,
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (!isEmailValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red.shade100,
            duration: Duration(seconds: 3),
            showCloseIcon: true,
            closeIconColor: Colors.white,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'Invalid Email!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter a Valid Email Address',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red.shade400,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
  }

}

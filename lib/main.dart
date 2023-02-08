import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_prefences/homepage.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'SignUp.dart';
import 'global.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ),
  );
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final snackBar = SnackBar(content: Text(' Invalid Password or Email.'));

  @override
 void initState() {
    getValidationData().whenComplete(()  async{
      Timer(Duration(seconds: 2), () => (Global.finalEmail == null || Global.finalPassword == null ? LoginScreen() : homepage()),);
      // if(finalEmail == null)
      //   {
      //     if(finalPassword == null)
      //       {
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      //       }
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      //   }
      // else
      //   {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
      //   }
      print("${Global.finalPassword}");
      print("${Global.finalEmail}");
    });
    super.initState();
  }
  Future getValidationData() async {

       final SharedPreferences prefs = await SharedPreferences.getInstance();
       var obtainedEmail = prefs.getString('email');
       var obtainedPassword = prefs.getString('password');
       setState(() {
         Global.finalEmail = obtainedEmail;
         Global.finalPassword = obtainedPassword;
       });
       print("${Global.finalEmail}");
       print("${Global.finalPassword}");

    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // var obtainedEmail = prefs.getString('email');
    // var obtainedPassword = prefs.getString('password');
    // setState(() {
    //   finalEmail = obtainedEmail;
    //   finalPassword = obtainedPassword;
    // });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children:[
          Container(
            height: double.infinity,
              width: double.infinity,
              child: Image.network('https://i.pinimg.com/originals/2a/7e/f5/2a7ef5fb008a1880f2ddeecb82d7f4ab.gif',fit: BoxFit.cover,)),
          Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                ),
              ),
              Container(
                height: 20,
                //margin: EdgeInsets.only(top: 20),
              ),
              Container(
                height: 70,
                width: 320,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                ),
              ),

           Container(
             margin: EdgeInsets.only(top: 40),
           ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          if(emailController==Global.finalEmail)
                          {
                            if(passwordController==Global.finalPassword)
                            {
                              print("both valid");
                              Navigator.push(context, MaterialPageRoute(builder: (context) => homepage()));
                            }
                            print("email valid");
                            final snackBar = SnackBar(
                              content: Text(' Hey! I am a SnackBar message.'),
                            );
                          }
                          else {
                            print("invalid");
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context) => homepage()));

                        },
                        child: Text('Login',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      alignment: Alignment.center,
                      child: Text('SignUp',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    ],
      ),

    );
  }
}

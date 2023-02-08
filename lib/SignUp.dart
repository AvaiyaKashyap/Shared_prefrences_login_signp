

import 'package:flutter/material.dart';
import 'package:shared_prefences/homepage.dart';
import 'package:shared_prefences/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
 final  TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                'https://i.pinimg.com/originals/20/ba/af/20baaf821557c58fa40bce69ca304c76.gif',
                fit: BoxFit.cover,
              )),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailController,
                      // onChanged: (value) {
                      //   value = email;
                      // },
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
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: TextField(
                      controller: _passwordController,
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
                    GestureDetector(
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('email', _emailController.text);
                        prefs.setString('password',_passwordController.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
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

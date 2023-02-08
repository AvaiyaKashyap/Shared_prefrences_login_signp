import 'package:flutter/material.dart';
import 'package:shared_prefences/main.dart';
import "dart:math";

import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart';
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  double circleX= 0;
  double circleY= 0;



    Random random = new Random();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network('https://i.pinimg.com/originals/b9/2d/ff/b92dff4da3281f07a64b52a15b017400.gif',fit: BoxFit.fitHeight,),
          ),

          Align(
            alignment: Alignment(0,-0.9),
              child: InkWell(
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  final delete = await prefs.remove('email');
                  final delete2 = await prefs.remove('password');

                  print(Global.finalPassword);
                  print(Global.finalEmail);
                },
                  child: Text("Tap the emoji to logout 🙂"))),
          Align(
            alignment: Alignment(circleX,circleY),
            child: InkWell(
              onTap: (){
                setState(() {
                   circleX = (random.nextDouble() * 2) - 1;
                   circleY = (random.nextDouble() * 2) - 1;
                });

              },

              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment(0,-0.1),
                child: Text('(•_•)',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade600,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

      ]
      ),
    );
  }
}

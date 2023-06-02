import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

import 'package:fradio_nullsafety/fradio_nullsafety.dart';


import '../widgets/ButtonWidget/ButtonWidget.dart';
import '../widgets/console_widgets/joystick_control.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void callback(x, y) {
    log('callback x => $x and y $y');
  }
//  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
        backgroundColor: Colors.grey[300],
        // appBar: AppBar(
        //   backgroundColor: Colors.grey[900],
        //   actions: [
        //     IconButton(
        //       alignment: Alignment.topLeft,
        //       onPressed: signUserOut,
        //   ],
        // ),
        body: SafeArea(
          child: Row(
         //   crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // JoystickView(),
                    Container(
                      width: 590,

                      height: 550,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: Colors.black,
                            width: 20,
                          )),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(


                          icon: Icon(Icons.settings,


                              color: Colors.black,
                              size: 40),
                          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Settting(),),);},


                        ),

                       // SizedBox(height: 100),
                        JoyStick(radius: 50.0, stickRadius: 20, callback: callback),
                        ButtonWidget(),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ));
  }
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/screens/homescreen.dart';

import 'package:flutter/material.dart';

import 'hscreen.dart';
import 'login_screen.dart';

// import 'home_page.dart';

class AuthPage extends StatelessWidget {
  //const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return HomePageCosole();
          }

          // user is NOT logged in
          else {
            return welcomescreen();
          }
        },
      ),
    );
  }
}

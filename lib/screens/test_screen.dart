import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            DatabaseReference ref = FirebaseDatabase.instance.ref();
            debugPrint(FirebaseAuth.instance.currentUser?.uid);

            try {
              // await ref.set({
              //   "alarmMode": "on",
              // });

              await ref.get().then((DataSnapshot snapshot) {
                debugPrint(snapshot.value.toString());
              });
            } catch (e) {
              debugPrint('Error: $e');
            }
          },
          child: const Text('Test Screen'),
        ),
      ),
    );
  }
}

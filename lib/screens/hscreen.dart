import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

import 'package:toggle_switch/toggle_switch.dart';
import 'package:video_player/video_player.dart';

import '../components/AppBarConsole/console_appbar.dart';

class HomePageCosole extends StatefulWidget {
  const HomePageCosole({Key? key}) : super(key: key);

  @override
  State<HomePageCosole> createState() => _HomePageCosoleState();
}

class _HomePageCosoleState extends State<HomePageCosole> {
  late VideoPlayerController _controller;
  bool booleanValue = false;
  DatabaseReference? _ref;

  static const labels = ['on', 'off', 'auto'];

  @override
  void initState() {
    super.initState();
    initializeFirebase();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
    _ref = FirebaseDatabase.instance.ref();
  }

  // HomePage({super.key});
  void callback(x, y) {
    log('callback x => $x and y $y');
  }

  Future<void> initializeFirebase() async {
    // await Firebase.initializeApp();

    // _databaseReference = FirebaseDatabase.instance.ref().child('');
  }

  void updateon() {
    _ref!.update({'ON': true});
    debugPrint(_ref.toString());
  }

  void updateoff() {
    _ref!.update({'OFF': true});
    debugPrint(_ref.toString());
  }

  void updateauto() {
    _ref!.update({'AT': true});
    debugPrint(_ref.toString());
  }

  void udpateDb(Map<String, dynamic> data) {
    _ref!.update(data);
  }

  // final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: FutureBuilder(
              future: _ref!.get(),
              builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                }

                final data = snapshot.data!.value as Map<dynamic, dynamic>;

                double lefthand = (data['lefthand'] ?? 0).toDouble();
                double righthand = (data['righthand'] ?? 0).toDouble();
                String alarmmode = data['alarmmode'] ?? 'off';
                String lightmode = data['lightmode'] ?? 'off';
                String lockermode = data['lockermode'] ?? 'off';
                String vaccumMode = data['vaccumMode'] ?? 'off';

                return Column(
                  children: [
                    const ConsoleAppBar(),
                    Expanded(
                      child: Stack(
                        children: [
                          _controller.value.isInitialized
                              ? VideoPlayer(_controller)
                              : Container(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Slider(
                                      min: 0,
                                      max: 180,
                                      value: lefthand,
                                      onChanged: (val) {
                                        setState(() => lefthand = val);
                                      },
                                    ),
                                    ToggleSwitch(
                                      iconSize: 15.0,
                                      minWidth: 60.0,
                                      cornerRadius: 20.0,
                                      inactiveFgColor: Colors.white,
                                      activeBgColors: const [
                                        [Colors.green],
                                        [Colors.red],
                                        [Colors.orange]
                                      ],
                                      icons: const [
                                        Icons.lightbulb,
                                        Icons.lightbulb_outline,
                                        Icons.hdr_auto_rounded
                                      ],
                                      initialLabelIndex:
                                          labels.indexOf(lightmode),
                                      totalSwitches: 3,
                                      labels: labels,
                                      customTextStyles: const [
                                        TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w900)
                                      ],
                                      onToggle: (index) {
                                        switch (index) {
                                          case 0:
                                            udpateDb({'lightmode': 'on'});
                                            break;
                                          case 1:
                                            udpateDb({'lightmode': 'off'});
                                            break;
                                          case 2:
                                            udpateDb({'lightmode': 'auto'});
                                            break;
                                          default:
                                            break;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    ToggleSwitch(
                                      // changeOnTap: true,

                                      iconSize: 15.0,
                                      minWidth: 60.0,
                                      cornerRadius: 20.0,
                                      activeBgColors: const [
                                        [Colors.green],
                                        [Colors.red],
                                        [Colors.orange]
                                      ],
                                      icons: const [
                                        Icons.alarm_on,
                                        Icons.alarm_off,
                                        Icons.hdr_auto_rounded
                                      ],
                                      inactiveFgColor: Colors.white,
                                      initialLabelIndex:
                                          labels.indexOf(alarmmode),
                                      totalSwitches: 3,
                                      labels: labels,
                                      customTextStyles: const [
                                        TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w900),
                                      ],
                                      onToggle: (index) {
                                        switch (index) {
                                          case 0:
                                            udpateDb({'alarmmode': 'on'});
                                            break;
                                          case 1:
                                            udpateDb({'alarmmode': 'off'});
                                            break;
                                          case 2:
                                            udpateDb({'alarmmode': 'auto'});
                                            break;
                                          default:
                                            break;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    ToggleSwitch(
                                      iconSize: 15.0,
                                      minWidth: 60.0,
                                      cornerRadius: 20.0,
                                      activeBgColors: const [
                                        [Colors.green],
                                        [Colors.red],
                                        [Colors.orange]
                                      ],
                                      icons: const [
                                        Icons.lock,
                                        Icons.lock_open,
                                        Icons.hdr_auto_rounded
                                      ],
                                      inactiveFgColor: Colors.white,
                                      initialLabelIndex:
                                          labels.indexOf(lockermode),
                                      totalSwitches: 3,
                                      labels: labels,
                                      customTextStyles: const [
                                        TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w900),
                                      ],
                                      onToggle: (index) {
                                        switch (index) {
                                          case 0:
                                            udpateDb({'lockermode': 'on'});
                                            break;
                                          case 1:
                                            udpateDb({'lockermode': 'off'});
                                            break;
                                          case 2:
                                            udpateDb({'lockermode': 'auto'});
                                            break;
                                          default:
                                            break;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    ToggleSwitch(
                                      minWidth: 60.0,
                                      initialLabelIndex:
                                          labels.indexOf(vaccumMode),
                                      cornerRadius: 20.0,
                                      activeFgColor: Colors.black,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['', 'off'],
                                      icons: const [
                                        Icons.cleaning_services,
                                        Icons.clear
                                      ],
                                      activeBgColors: const [
                                        [Colors.green],
                                        [Colors.red]
                                      ],
                                      onToggle: (index) {
                                        switch (index) {
                                          case 0:
                                            udpateDb({'vaccumMode': 'on'});
                                            break;
                                          case 1:
                                            udpateDb({'vaccumMode': 'off'});
                                            break;
                                          default:
                                            break;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Slider(
                                      value: righthand,
                                      min: 0,
                                      max: 180,
                                      onChanged: (val) {
                                        setState(() {
                                          righthand = val;
                                        });
                                      },
                                    ),
                                    Joystick(
                                      listener: (details) {},
                                      mode: JoystickMode.horizontalAndVertical,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }),
        ));
  }
}

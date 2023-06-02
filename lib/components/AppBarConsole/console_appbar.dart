import 'package:flutter/material.dart';

import '../../screens/settings.dart';

class ConsoleAppBar extends StatefulWidget {
  const ConsoleAppBar({Key? key}) : super(key: key);

  @override
  State<ConsoleAppBar> createState() => _ConsoleAppBarState();
}

class _ConsoleAppBarState extends State<ConsoleAppBar> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String dateStr = today.toString().substring(0, 10);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Aura",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(dateStr,
              style: const TextStyle(color: Colors.white, fontSize: 12)),
          const Text("connected",
              style: TextStyle(color: Colors.white, fontSize: 12)),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const Settting()),
              );
            },
            icon: const Icon(Icons.settings),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
class SettingsContent extends StatelessWidget {
  const SettingsContent({
    Key? key,
    required this.tittle,
    required this.icon,
    this.endIcon = true,
    required this.onPress
  }) : super(key: key);
  final String tittle;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 50,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.yellowAccent,
        ),
        child: Icon(icon,color: Colors.black),
      ),
      title: Text(
        tittle,textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.yellowAccent,
        ),
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
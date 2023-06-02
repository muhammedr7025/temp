import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final String obsuringCharacter;
  final IconData icons;

  const LoginTextField({
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
    required this.obsuringCharacter,
    required this.icons,
  });
  // const LoginTextField(Set set, {Key? key, required this.hintText, required this.labelText, required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,

        //  scrollPadding: EdgeInsets.only(bottom: 220),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          fillColor: Colors.black,
          filled: true,
          hintText: hintText,
          labelText: labelText,
          prefixIcon: Icon(icons, color: Colors.yellow),
          labelStyle: const TextStyle(color: Colors.white),
          hintStyle: const TextStyle(color: Colors.yellow),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow),
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
      ),
    );
  }
}

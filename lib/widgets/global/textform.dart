import 'package:flutter/material.dart';

class Textform extends StatelessWidget {
  const Textform(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.controller,
      required this.obscureText
      });

  final String hintText;
  final dynamic prefixIcon;
  final dynamic suffixIcon;
  final TextEditingController controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText, prefixIcon: prefixIcon, suffixIcon: suffixIcon),
      ),
    );
  }
}

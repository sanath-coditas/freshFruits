import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  const CustomTextField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}

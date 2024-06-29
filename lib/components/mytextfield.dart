import 'package:flutter/material.dart';
import 'package:semara_app/utils.dart';

class MyTextFiled extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Function(String)? onChanged;
  const MyTextFiled(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: bodyText16.copyWith(
                color: turbo950, fontWeight: FontWeight.w500)
            // Hide password characters
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:semara_app/utils.dart';

class InputRoutines extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const InputRoutines({
    super.key,
    required this.hint,
    this.controller,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: bodyText16.copyWith(color: Colors.grey),
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hint,
          hintStyle: bodyText16.copyWith(color: Colors.grey)),
    );
  }
}

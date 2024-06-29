import 'package:flutter/material.dart';

const String baseURL = "http://10.0.2.2:8000/api";
// const String baseURL = "https://103.84.116.66/semara/api";
const Map<String, String> headers = {"Content-type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}

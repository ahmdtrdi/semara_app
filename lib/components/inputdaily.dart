import 'package:flutter/material.dart';
import 'package:semara_app/utils.dart';

class InputDaily extends StatelessWidget {
  final String title;
  final String hint;
  final double width;
  final TextEditingController? controller;
  final Widget? widget;

  const InputDaily({
    super.key,
    required this.title,
    required this.hint,
    required this.width,
    this.controller,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: bodyText15.copyWith(
                color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.white,
              width: width,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: widget == null ? false : true,
                      controller: controller,
                      style: bodyText16.copyWith(color: Colors.grey),
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: hint,
                          hintStyle: bodyText16.copyWith(
                              color: turbo950, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  widget == null
                      ? Container()
                      : Container(
                          child: widget,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

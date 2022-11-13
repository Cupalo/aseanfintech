import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
    required this.rxString,
    this.hint,
    this.obsecure,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);
  final RxString rxString;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obsecure;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        initialValue: rxString.value,
        onChanged: (value) {
          rxString.value = value;
        },
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hint,
        ),
        obscureText: obsecure ?? false,
      );
    });
  }
}

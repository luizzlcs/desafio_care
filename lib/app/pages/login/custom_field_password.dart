import 'package:flutter/material.dart';

import '../ui/custom_field.dart';

class CustomFieldPassword extends StatelessWidget {
  final TextEditingController controller;
  final bool obscurePassword;

  const CustomFieldPassword({
    Key? key,
    required this.controller,
    required this.obscurePassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      obscureText: obscurePassword,
      fillColor: const Color(0xff00DEED),
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      keyboardType: TextInputType.number,
      hintText: 'Senha',
      hintStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
      filled: true,
    );
  }
}

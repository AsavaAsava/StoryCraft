import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.validator,
    required this.hintText,
    required this.prefixIcon,
    this.isObscure,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String hintText;
  final Icon prefixIcon;
  final bool? isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) => validator!(value),
      obscureText: isObscure ?? false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}

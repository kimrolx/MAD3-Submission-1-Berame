import 'package:flutter/material.dart';
import 'package:mad3_submission_1/src/constants/text.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.obscureText,
    this.controller,
    this.validator,
    required this.keyboardType,
    this.onFieldSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      style: AppTextStyles.inputStyle,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.inputLabelStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

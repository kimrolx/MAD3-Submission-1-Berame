import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mad3_submission_1/src/constants/components/custom_text_form_field.dart';
import 'package:mad3_submission_1/src/constants/text.dart';

class LoginScreen extends StatelessWidget {
  static const String route = "/auth";
  static const String name = "Login Screen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Image.asset("assets/images/logo.png"),
                Gap(height * 0.1),
                Text(
                  "EcoPoints",
                  style: AppTextStyles.header,
                ),
                Text(
                  "Your partner in a sustainable future.",
                  style: AppTextStyles.header3,
                ),
                Gap(height * 0.075),
                const CustomTextFormField(
                  labelText: "Email",
                  obscureText: false,
                  keyboardType: TextInputType.text,
                ),
                Gap(height * 0.015),
                const CustomTextFormField(
                  labelText: "Password",
                  obscureText: true,
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

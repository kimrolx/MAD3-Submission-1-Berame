import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../../constants/text.dart';
import '../../../controllers/auth_controller.dart';
import '../../../dialogs/waiting_dialog.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "/auth";
  static const String name = "Login Screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> formKey;
  late TextEditingController username, password;
  late FocusNode usernameFn, passwordFn;

  bool obfuscate = true;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    username = TextEditingController();
    password = TextEditingController();
    usernameFn = FocusNode();
    passwordFn = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    username.dispose();
    password.dispose();
    usernameFn.dispose();
    passwordFn.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: width,
          height: height,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Image.asset("assets/images/logo.png"),
                  Gap(height * 0.1),
                  Text("EcoPoints", style: AppTextStyles.header),
                  Text(
                    "Your partner in a sustainable future.",
                    style: AppTextStyles.header3,
                  ),
                  Gap(height * 0.075),
                  Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: CustomTextFormField(
                              labelText: "Email",
                              focusNode: usernameFn,
                              controller: username,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              errorMaxLines: 3,
                              onEditingComplete: () {
                                passwordFn.requestFocus();
                              },
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Username is required"),
                                MinLengthValidator(
                                  4,
                                  errorText:
                                      "Username must be at least 6 characters long",
                                ),
                                PatternValidator(
                                  r'^[a-zA-Z0-9 ]+$',
                                  errorText:
                                      'Username cannot contain any special characters',
                                ),
                              ]).call,
                            ),
                          ),
                          Gap(height * 0.015),
                          Flexible(
                            child: CustomTextFormField(
                              labelText: "Password",
                              focusNode: passwordFn,
                              controller: password,
                              obscureText: obfuscate,
                              keyboardType: TextInputType.visiblePassword,
                              errorMaxLines: 3,
                              onEditingComplete: () {
                                passwordFn.unfocus();
                                onSubmit();
                              },
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obfuscate = !obfuscate;
                                    });
                                  },
                                  icon: Icon(obfuscate
                                      ? Icons.remove_red_eye_rounded
                                      : CupertinoIcons.eye_slash)),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Password is required"),
                                MinLengthValidator(
                                  8,
                                  errorText:
                                      "Password must to be at least 12 characters long",
                                ),
                                PatternValidator(
                                  r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+?\-=[\]{};':,.<>]).*$",
                                  errorText:
                                      'Password must contain at least one symbol, one uppercase letter, one lowercase letter, and one number',
                                ),
                              ]).call,
                            ),
                          ),
                        ],
                      )),
                  Gap(height * 0.025),
                  CustomElevatedButton(
                    onPressed: () {
                      onSubmit();
                    },
                    width: width,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Log in",
                      style: GoogleFonts.poppins(
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                  ),
                  Gap(height * 0.01),
                  Text(
                    "Forgot password?",
                    style: AppTextStyles.greyTextStyle,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: AppTextStyles.greyTextStyle,
                          children: [
                            TextSpan(
                              text: "Join us!",
                              style: GoogleFonts.poppins(
                                  fontSize: width * 0.035,
                                  color: lightGreen,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      WaitingDialog.show(context,
          future: AuthController.I
              .login(username.text.trim(), password.text.trim()));
    }
  }
}

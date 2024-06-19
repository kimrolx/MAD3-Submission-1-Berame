import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mad3_submission_1/src/constants/colors.dart';

class AppTextStyles {
  static final TextStyle header = GoogleFonts.sriracha(
    textStyle: const TextStyle(
      fontSize: 50.0,
      color: primaryTextColor,
    ),
  );

  static final TextStyle header3 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: black,
    ),
  );

  static final TextStyle greyTextStyle = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 15.0,
      color: gray,
    ),
  );

  static final TextStyle inputStyle = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 15.0,
      color: black,
    ),
  );

  static final TextStyle inputLabelStyle = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 15.0,
      color: gray,
    ),
  );
}

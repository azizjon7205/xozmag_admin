
import 'package:flutter/material.dart';

double calculateLetterSpacing(double fontSize, double percentage) {
  return (fontSize * percentage) / 100;
}

class AppTextStyles {
  static final TextStyle titleH1 = TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.w500,
      height: 64 / 56,
      letterSpacing: calculateLetterSpacing(56, -1));

  static final TextStyle titleH2 = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w500,
      height: 56 / 48,
      letterSpacing: calculateLetterSpacing(48, -1));

  static final TextStyle titleH3 = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w500,
      height: 48 / 40,
      letterSpacing: calculateLetterSpacing(40, -1));

  static final TextStyle titleH4 = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      height: 40 / 32,
      letterSpacing: calculateLetterSpacing(32, -0.5));

  static final TextStyle titleH5 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 32 / 24,
      letterSpacing: calculateLetterSpacing(24, 0));

  static final TextStyle titleH6 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 28 / 20,
      letterSpacing: calculateLetterSpacing(20, 0));

  static final TextStyle labelXLarge = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 32 / 24,
      letterSpacing: calculateLetterSpacing(24, -1.5));

  static final TextStyle labelLarge = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 24 / 18,
      letterSpacing: calculateLetterSpacing(18, -1.5));

  static final TextStyle labelMedium = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 24 / 16,
      letterSpacing: calculateLetterSpacing(16, -1.1));

  static final TextStyle labelSmall = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 20 / 14,
      letterSpacing: calculateLetterSpacing(14, -0.6));

  static final TextStyle labelXSmall = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 16 / 12,
      letterSpacing: calculateLetterSpacing(12, 0));

  static final TextStyle paragraphXLarge = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      height: 32 / 24,
      letterSpacing: calculateLetterSpacing(24, -1.5));

  static final TextStyle paragraphLarge = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 24 / 18,
      letterSpacing: calculateLetterSpacing(18, -1.5));

  static final TextStyle paragraphMedium = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: calculateLetterSpacing(16, -1.1));

  static final TextStyle paragraphSmall = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 20 / 14,
      letterSpacing: calculateLetterSpacing(14, 0));

  static final TextStyle paragraphXSmall = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 16 / 12,
      letterSpacing: calculateLetterSpacing(12, 0));

  static final TextStyle subheadMedium = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 24 / 16,
      letterSpacing: calculateLetterSpacing(16, 6));

  static final TextStyle subheadSmall = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 20 / 14,
      letterSpacing: calculateLetterSpacing(14, 6));

  static final TextStyle subheadXSmall = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 16 / 12,
      letterSpacing: calculateLetterSpacing(12, 4));

  static final TextStyle subheadXXSmall = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 12 / 11,
      letterSpacing: calculateLetterSpacing(11, 2));

  static final TextStyle docsLabel = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 32 / 18,
      letterSpacing: calculateLetterSpacing(18, -1.5));

  static final TextStyle docsParagraph = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 32 / 18,
      letterSpacing: calculateLetterSpacing(18, -1.5));
}

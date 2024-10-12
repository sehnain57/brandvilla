import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppMainText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  const AppMainText({super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign, this.height, this.overflow, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        decoration: decoration,
        color: color??Colors.black,
      ),
    );
  }
}

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? height;
  final TextDecoration? decoration;

  const AppText({super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign, this.overflow, this.height, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        height: height,
        decoration: decoration,
        fontSize: fontSize??14,
        fontWeight: fontWeight,
        color: color ,
      ),
    );
  }
}
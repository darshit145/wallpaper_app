import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomText extends StatelessWidget {
  final String content;
  final double size;
  final color;
  CustomText({required this.content,required this.size,required this.color});


  @override
  Widget build(BuildContext context) {
    return Text("$content",overflow: TextOverflow.ellipsis,style: GoogleFonts.breeSerif(
      color: color,
      fontSize: size

    ),);
  }
}
class CustomTextForDescription extends StatelessWidget {
  final String content;
  final double size;
  final color;
  CustomTextForDescription({required this.content,required this.size,required this.color});


  @override
  Widget build(BuildContext context) {
    return Text("$content", style: GoogleFonts.breeSerif(
        color: color,
        fontSize: size

    ),);
  }
}

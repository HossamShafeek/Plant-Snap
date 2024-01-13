import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({super.key,required this.text,
    this.color,
    required this.fontWeight,
    required this.size,
    this.maxLine
  });
  final String text;
  final double size;
  final Color? color;
  final FontWeight fontWeight;
  final int? maxLine;
  @override
  Widget build(BuildContext context){
    return Text(
        text,
        maxLines:maxLine,
        style:GoogleFonts.roboto(
          fontSize:size,
          color:color,
          fontWeight: fontWeight,
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      required this.title,
      this.color,
      this.fontSize,
      this.fontWeight})
      : super(key: key);
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 3,
      style: GoogleFonts.itim(
        textStyle:  TextStyle(
          color: color, fontSize: fontSize, fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis
        )
      ),
      // style:
      //     TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight,
      //     fontFamily: "Poppin",
      //     overflow: TextOverflow.ellipsis
      //     ),
    );
  }
}

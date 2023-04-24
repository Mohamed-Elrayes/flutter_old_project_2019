import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool? softWrap;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextWidthBasis? textWidthBasis;
  final TextDirection? textDirection;
  final bool? colorTest;
  final bool? customColorText;
  final double? widthBox;
  const CustomTextWidget({
    Key? key,
    required this.text,
    this.style,
    this.softWrap,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.textWidthBasis,
    this.textDirection,
    this.colorTest,
    this.customColorText,
    this.widthBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthBox,
      // color: Colors.red ,
      child: Text(
        text,
        textAlign: textAlign,
        textWidthBasis: textWidthBasis,
        softWrap: softWrap,
        style: style,
        maxLines: maxLines,
        textDirection: textDirection,
        overflow: overflow,
      ),
    );
  }
}



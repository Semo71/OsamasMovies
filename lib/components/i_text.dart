import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

import 'custom_colors.dart';

class IText extends StatelessWidget {
  final String? text;
  final Color color;
  final double? letterSpacing;
  final double fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final int maxLines;
  final double? lineSpacing;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final bool isLTR;
  final double minFontSize;

  const IText(
    this.text, {
    this.color = CustomColors.gray8,
    this.letterSpacing,
    this.fontSize = 14,
    this.height,
    this.fontWeight,
    this.padding,
    this.alignment,
    this.maxLines = 1,
    this.lineSpacing,
    this.textAlign,
        this.decoration,
        this.minFontSize = 10,
    this.isLTR = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AutoSizeText(
        text ?? "",
        textAlign: textAlign,
        minFontSize: minFontSize,
        maxLines: maxLines,
        textDirection: isLTR ? TextDirection.ltr : null,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          height: lineSpacing,
          // the height between text, default is null
          fontWeight: fontWeight,
          decoration: decoration,
        ),
      );
}

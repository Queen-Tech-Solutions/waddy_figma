// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../Constants/app_constants.dart';

class CommonTitleText extends StatelessWidget {
  final String textKey;
  final Color textColor;

  final FontWeight textFontWeight;

  final double textHeight;

  final double textFontSize;
  final double minTextFontSize;

  final TextAlign textAlignment;

  final int lines;
  final TextOverflow textOverflow;
  final bool underLine;

  const CommonTitleText({
    Key? key,
    required this.textKey,
    this.textColor = AppConstants.greyTextColor,
    this.textFontWeight = FontWeight.normal,
    this.textFontSize = AppConstants.normalFontSize,
    this.minTextFontSize = AppConstants.smallFontSize,
    this.textAlignment = TextAlign.center,
    this.lines = 1,
    this.textOverflow = TextOverflow.visible,
    this.textHeight = 1.7,
    this.underLine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textKey,
      overflow: TextOverflow.ellipsis,
      // minFontSize: minTextFontSize,
      style: Theme.of(context).textTheme.headline4?.copyWith(
            color: textColor,
            fontSize: textFontSize,
            fontWeight: textFontWeight,
            overflow: textOverflow,
            height: textHeight,
            decoration:
                underLine ? TextDecoration.underline : TextDecoration.none,
          ),
      textAlign: textAlignment,
      maxLines: lines,
    );
  }
}

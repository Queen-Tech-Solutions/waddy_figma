import 'package:flutter/material.dart';

import '../Constants/app_constants.dart';
import 'common_title_text.dart';

class CommonTextButton extends StatelessWidget {
  final Function() onTap;
  final bool isText;
  final String textKey;
  final FontWeight? fontWeight;
  final double? textFontSize;
  final Color? textColor;
  final bool showUnderline;
  final double width;
  final double height;
  final TextAlign textAlign;

  const CommonTextButton(
      {Key? key,
      required this.onTap,
      required this.textKey,
      this.isText = true,
      this.fontWeight,
      this.textFontSize,
      this.textColor,
      this.showUnderline = false,
      this.textAlign = TextAlign.center,
      this.height = 100,
      this.width = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: width,
      height: height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: CommonTitleText(
            textKey: textKey,
            textFontWeight: fontWeight ?? FontWeight.w400,
            textFontSize: textFontSize ?? AppConstants.smallFontSize,
            textColor: textColor ?? AppConstants.mainBGColor,
            textAlignment: textAlign,
            underLine: showUnderline,
          ),
        ),
      ),
    );
  }
}

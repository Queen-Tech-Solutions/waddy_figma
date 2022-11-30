import 'package:flutter/material.dart';
import '../../Constants/app_constants.dart';
import '../Helpers/shared.dart';
import 'common_title_text.dart';

class CommonGlobalButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressedFunction;
  final Color? buttonBackgroundColor;
  final Color? onPressedColor;
  final Color? shadowBackgroundColor;
  final double? elevation;
  final double? width;
  final double? height;
  final Color? buttonTextColor;
  final double? buttonTextSize;
  final FontWeight? buttonTextFontWeight;
  final Color? borderColor;
  final double? radius;
  final bool isLoading;
  final bool showBorder;
  final bool isEnable;
  final IconData? buttonIcon;
  final bool withIcon;
  final double? iconSize;

  const CommonGlobalButton(
      {Key? key,
      required this.buttonText,
      required this.onPressedFunction,
      this.buttonBackgroundColor,
      this.onPressedColor,
      this.shadowBackgroundColor,
      this.elevation = 5.0,
      this.width = 343,
      this.height = 48,
      this.buttonTextColor = AppConstants.whiteColor,
      this.buttonTextFontWeight = FontWeight.normal,
      this.buttonTextSize = AppConstants.smallFontSize,
      this.radius = AppConstants.buttonRadius,
      this.isLoading = false,
      this.showBorder = false,
      this.isEnable = true,
      this.borderColor = AppConstants.mainBGColor,
      this.withIcon = false,
      this.buttonIcon, this.iconSize = AppConstants.mediumFontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = getWidgetWidth(width!);
    double buttonHeight = getWidgetHeight(height!);

    return ElevatedButton(
        onPressed: isLoading || !isEnable ? null : onPressedFunction,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              width: 1,
              color: showBorder
                  ? isLoading || !isEnable
                      ? AppConstants.transparentColor
                      : borderColor!
                  : isLoading || !isEnable
                      ? AppConstants.transparentColor
                      : buttonBackgroundColor ?? AppConstants.mainBGColor,
            ),
          ),
          elevation: MaterialStateProperty.all<double>(elevation!),
          shadowColor: MaterialStateProperty.all(
            shadowBackgroundColor ?? AppConstants.greyTextColor.withOpacity(.3),
          ),
          overlayColor: MaterialStateProperty.all(
            onPressedColor ?? AppConstants.greyTextColor.withOpacity(.25),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius!),
            ),
          ),
          fixedSize: MaterialStateProperty.all<Size>(Size(buttonWidth, buttonHeight)),
          backgroundColor: !isEnable
              ? MaterialStateProperty.all(AppConstants.greyTextColor)
              : MaterialStateProperty.all(buttonBackgroundColor ?? AppConstants.mainBGColor),
        ),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: getWidgetHeight(33),
                        height: getWidgetHeight(33),
                        decoration: BoxDecoration(
                            color: buttonBackgroundColor,
                            border: Border.all(
                              color: AppConstants.lightMainBGColor,
                              width: 1,
                            ),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                              width: getWidgetWidth(33),
                              height: getWidgetHeight(33),
                              child: const CircularProgressIndicator(
                                color: AppConstants.lightMainBGColor,
                              )),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        bottom: 5,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: getWidgetHeight(22),
                          height: getWidgetHeight(22),
                          decoration: BoxDecoration(
                              color: buttonBackgroundColor,
                              border: Border.all(
                                color: AppConstants.lightMainBGColor,
                                width: 1,
                              ),
                              shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                  getSpaceWidth(5),
                  CommonTitleText(
                    textKey: "جاري المعالجة",
                    textColor: AppConstants.mainBGColor,
                    textFontSize: buttonTextSize!,
                    textFontWeight: buttonTextFontWeight!,
                  ),
                ],
              )
            : withIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonTitleText(
                        textKey: buttonText,
                        textColor: isEnable
                            ? isLoading
                                ? AppConstants.whiteColor
                                : buttonTextColor!
                            : AppConstants.whiteColor,
                        textFontSize: buttonTextSize!,
                        textFontWeight: buttonTextFontWeight!,
                      ),
                      getSpaceWidth(4),
                      Icon(
                        buttonIcon,
                        color: isEnable
                            ? isLoading
                                ? AppConstants.whiteColor
                                : buttonTextColor!
                            : AppConstants.whiteColor,
                        size: iconSize,
                      ),
                    ],
                  )
                : CommonTitleText(
                    textKey: buttonText,
                    textColor: isEnable
                        ? isLoading
                            ? AppConstants.whiteColor
                            : buttonTextColor!
                        : AppConstants.whiteColor,
                    textFontSize: buttonTextSize!,
                    textFontWeight: buttonTextFontWeight!,
                  ));
  }
}

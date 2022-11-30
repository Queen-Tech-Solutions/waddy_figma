import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constants/app_constants.dart';
import '../Helpers/shared.dart';


class CommonTextFormField extends StatelessWidget {
  final String? hintKey;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? textInputColor;
  final Function()? onTap;
  final bool enabled;
  final bool autoFocus;
  final bool isSelected;
  final bool withPrefixIcon;
  final bool evaluation;
  final bool isObscureText;
  final bool isDigitOnly;
  final String? Function(String?)? validator;
  final bool withSuffixIcon;
  final double? fieldWidth;
  final double? fieldHeight;
  final double? contentPadding;
  final int minLines;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? onChanged;
  final Function()? onSaved;
  final Color? borderColor;
  final double? borderWidth;
  final Color? filledColor;
  final Color? hintColor;
  final Color? labelErrorStyle;
  final List<TextInputFormatter>? inputFormatter;
  final bool? isReadOnly;
  final TextInputAction? action;
  final TextAlign? labelHintTextAlign;
  final double? radius;
  final bool? alignMultipleLines;
  final FocusNode? fieldFocusNode;
  final double? hintFontSize;

  const CommonTextFormField({
    Key? key,
    this.hintKey,
    this.controller,
    this.keyboardType = TextInputType.name,
    this.onTap,
    this.enabled = true,
    this.autoFocus = false,
    this.isSelected = false,
    this.withPrefixIcon = true,
    this.isObscureText = false,
    this.evaluation = true,
    this.withSuffixIcon = false,
    this.fieldWidth,
    this.fieldHeight,
    this.contentPadding,
    this.isDigitOnly = false,
    this.minLines = 1,
    this.maxLines = 4,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSaved,
    this.borderColor,
    this.borderWidth,
    this.filledColor = AppConstants.lightMainBGColor,
    this.textInputColor = AppConstants.lightMainBGColor,
    this.hintColor = AppConstants.greyTextColor,
    this.labelErrorStyle = AppConstants.errorRedColor,
    this.inputFormatter,
    this.isReadOnly = false,
    this.action = TextInputAction.next,
    this.labelHintTextAlign = TextAlign.end,
    this.radius = AppConstants.containerRadius,
    this.alignMultipleLines = false,
    this.fieldFocusNode,
    this.hintFontSize = AppConstants.smallFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fieldHeight == null ? null : getWidgetHeight(fieldHeight!),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius!),),
      padding: EdgeInsets.zero,
      child: GestureDetector(
        onTap: onTap,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: TextFormField(
              autofocus: autoFocus,
              textAlignVertical: TextAlignVertical.center,
              controller: controller,
              minLines: minLines,
              maxLines: maxLines,
              onEditingComplete: onSaved,
              keyboardType: keyboardType,
              obscureText: isObscureText,
              onChanged: onChanged,
              readOnly: isReadOnly!,
              textAlign: labelHintTextAlign!,
              focusNode: fieldFocusNode,
              textInputAction: action,
              style: const TextStyle(
                  color: AppConstants.greyTextColor,
                  fontSize: AppConstants.normalFontSize,
                  fontWeight: FontWeight.w500),
              inputFormatters: inputFormatter,
              validator: validator,
              cursorColor: AppConstants.whiteColor,
              decoration: InputDecoration(
                hintText: hintKey,
                enabled: enabled,
                hintStyle: const TextStyle(
                    color: AppConstants.greyTextColor,
                    fontSize: AppConstants.normalFontSize,
                    fontWeight: FontWeight.w500),
                alignLabelWithHint: alignMultipleLines,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius!),
                  borderSide: const BorderSide(
                    width: 0.0,
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius!),
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.transparent,
                      width: borderWidth ?? 1),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius!),
                  borderSide: const BorderSide(
                    width: 0.0,
                    color: Colors.transparent,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius!),
                  borderSide: BorderSide(
                      color: labelErrorStyle ?? Colors.transparent,
                      width: borderWidth ?? 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius!),
                  borderSide: BorderSide(
                      color: labelErrorStyle ?? Colors.transparent,
                      width: borderWidth ?? 1),
                ),
                errorStyle: const TextStyle(
                        fontSize: AppConstants.smallFontSize,
                        fontWeight: FontWeight.w400,
                        height: 1)
                    .apply(
                  color: labelErrorStyle,
                ),
                contentPadding: EdgeInsets.all(contentPadding ?? 0),
                fillColor: filledColor!,
                isDense: true,
                filled: true,
                suffixIcon: withPrefixIcon ? prefixIcon : null,
                prefixIcon: withSuffixIcon ? suffixIcon : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

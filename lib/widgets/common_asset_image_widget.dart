import 'package:flutter/material.dart';
import '../Helpers/shared.dart';

class CommonAssetImageWidget extends StatelessWidget {
  final String imageString;
  final double height;
  final double width;
  final bool isCircular;
  final Color? imageColor;
  final double radius;
  final BoxFit fit;

  const CommonAssetImageWidget({
    Key? key,
    required this.imageString,
    required this.height,
    required this.width,
    this.isCircular = false,
    this.radius = 0.0,
    this.imageColor,
    this.fit = BoxFit.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        'assets/images/$imageString',
        fit: fit,
        color: imageColor,
        height: getWidgetHeight(height),
        width: isCircular ? getWidgetHeight(height) : getWidgetWidth(width),
      ),
    );
  }
}


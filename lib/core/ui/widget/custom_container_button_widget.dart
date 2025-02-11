// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/core/utils/extensions/widget_extensions.dart';

class CustomContainerButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final Color backgroundColor;
  final double border;
  final Color borderColor;
  final String text;
  final Widget? containerChild;
  final TextStyle textStyle;
  final double width;
  final EdgeInsets? margin;
  final double height;
  const CustomContainerButtonWidget({
    super.key,
    this.margin,
    this.containerChild,
    required this.onPress,
    required this.backgroundColor,
    required this.border,
    required this.borderColor,
    required this.text,
    required this.textStyle,
    this.width = 152,
    this.height = 42,
  });

  @override
  Widget build(BuildContext context) {
    if (width == 327) {
      debugPrint("customasf${width.w}");
    }
    return Container(
            width: width.w,
            height: height.h,
            margin: margin,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: backgroundColor,
                border:
                    Border.all(style: BorderStyle.solid, color: borderColor),
                borderRadius: BorderRadius.circular(border.h)),
            child: containerChild ??
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: textStyle,
                ))
        .onTap(onPress);
  }
}

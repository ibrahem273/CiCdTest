import 'package:flutter/material.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';

class CustomTextWidget extends StatelessWidget {
  final String content;
  final TextOverflow? overflow;
  final TextStyle? style;
  final TextAlign? align;
  const CustomTextWidget(
      {this.align,
      this.overflow,
      this.style,
      super.key,
      required this.content});
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      content,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: style ??
          context.exTextTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold, color: context.exOnBackground),
    );
  }
}

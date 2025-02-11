import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/core/resources/type_defs.dart';
import 'package:pos_app/core/ui/widget/custom_text_field.dart';
import 'package:pos_app/core/ui/widget/custom_text_widget.dart';
import 'package:pos_app/core/utils/extensions/widget_extensions.dart';

List<Widget> customTextFiledWithTitleWidget(
    {final TextStyle? titleStyle,
    final Widget? prefixIcon,
    final TextStyle? textStyle,
    final double? height,
    required final ValueNotifier<bool> openTextField,
    final TextStyle? errorTextStyle,
    final bool? enableTextFormField,
    final OnTapOutSideTypeDef? onTapOutSideFunction,
    final VoidFunctionStringTypeDef onFieldSubmitted,
    required final TextEditingController textEditingController,
    final StringFunctionTypeDef? textFieldValidator,
    required final FocusNode focusNode,
    final BoxConstraints? suffixIconConstraints,
    required final FocusNode nextFocusNode,
    final VoidCallback? onTap,
    // final Color? fillColor,
    final bool? autofocus,
    final double? textFormFieldCursorHeight,
    final List<TextInputFormatter>? textFormFieldFormatter,
    final TextDirection? textFormFieldDirection,
    final Widget? suffixIcon,
    final Widget? label,
    final VoidFunctionStringTypeDef? onChange,
    final Color? fillColor,
    final bool? obscureText,
    final int? maxLine,
    final TextInputType? keyboardType,
    final InputBorder? disabledBorder,
    final InputBorder? errorBorder,
    final InputBorder? errorFocusedBorder,
    final EdgeInsets? scrollPadding,
    final EdgeInsetsGeometry? contentPadding,
    final InputBorder? enabledBorder,
    final InputBorder? focusedBorder,
    final int? maxLength,
    final TextAlign? textAlign,
    required final String title}) {
  return [
    // 2.verticalSpace,
    CustomTextWidget(content: title, style: titleStyle).paddingVertical(10),
    2.verticalSpace,
    CustomTextFiledWidget(
      maxLength: maxLength,
      keyboardType: keyboardType,
      errorBorder: errorBorder,
      errorFocusedBorder: errorFocusedBorder,
      enabledBorder: enabledBorder,
      fillColor: fillColor,
      focusedBorder: focusedBorder,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      enableTextFormField: enableTextFormField,
      label: label,
      textStyle: textStyle,
      onFieldSubmitted: onFieldSubmitted,
      maxLine: maxLine,
      height: height,
      nextFocusNode: nextFocusNode,
      focusNode: focusNode,
      textEditingController: textEditingController,
      textFieldValidator: textFieldValidator ??
          (String? p0) {
            return null;
          },
      openTextField: openTextField,
    )
  ];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/core/resources/type_defs.dart';
import 'package:pos_app/core/ui/responsive_padding.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';

class CustomTextFiledWidget extends StatelessWidget {
  final TextStyle? textStyle;
  final ValueNotifier<bool> openTextField;
  ValueNotifier<bool>? valiidationListener = ValueNotifier<bool>(true);
  final TextStyle? errorTextStyle;
  final bool? enableTextFormField;
  final OnTapOutSideTypeDef? onTapOutSideFunction;
  final VoidFunctionStringTypeDef onFieldSubmitted;
  final TextEditingController textEditingController;
  final StringFunctionTypeDef? textFieldValidator;
  final FocusNode focusNode;
  final BoxConstraints? suffixIconConstraints;
  final FocusNode nextFocusNode;
  final VoidCallback? onTap;
  final bool autofocus;
  final double? textFormFieldCursorHeight;
  final List<TextInputFormatter>? textFormFieldFormatter;
  final TextDirection? textFormFieldDirection;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  //
  final Widget? label;
  final VoidFunctionStringTypeDef? onChange;
  final Color? fillColor;
  final bool? obscureText;
  final int? maxLine;
  final TextInputType? keyboardType;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? errorFocusedBorder;
  final EdgeInsets? scrollPadding;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final int? maxLength;
  final double? height;

  final TextAlign? textAlign;
  CustomTextFiledWidget({
    this.prefixIcon,
    this.textStyle,
    this.height,
    this.textFormFieldFormatter,
    this.onFieldSubmitted,
    this.maxLength,
    this.maxLine,
    this.errorTextStyle,
    this.contentPadding,
    this.textAlign,
    this.scrollPadding,
    this.disabledBorder,
    this.errorBorder,
    this.errorFocusedBorder,
    this.enabledBorder,
    this.focusedBorder,
    super.key,
    this.obscureText,
    required this.nextFocusNode,
    this.suffixIconConstraints,
    this.onChange,
    this.onTap,
    this.autofocus = false,
    this.label,
    this.keyboardType,
    this.onTapOutSideFunction,
    this.fillColor,
    this.suffixIcon,
    this.enableTextFormField,
    this.textFormFieldDirection,
    this.textFormFieldCursorHeight,
    required this.focusNode,
    required this.textEditingController,
    required this.textFieldValidator,
    required this.openTextField,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: openTextField,
        builder: (BuildContext context, bool value, Widget? child) =>
            ValueListenableBuilder(
              valueListenable: valiidationListener!,
              builder: (context, valiidationListenerValue, child) {
                return SizedBox(
                  height: height != null
                      ? height!.h
                      : (valiidationListenerValue ? 40.h : 70.h),
                  width: 380.w,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLines: maxLine,
                    key: key,
                    keyboardType: keyboardType,
                    obscureText: obscureText ?? false,
                    validator: (value) {
                      String? validationResult =
                          textFieldValidator!.call(value);
                      if (validationResult != null) {
                        Future.delayed(Duration(milliseconds: 200))
                            .then((value) {
                          valiidationListener!.value = false;
                        });
                      } else {
                        Future.delayed(Duration(milliseconds: 200))
                            .then((value) {
                          valiidationListener!.value = true;
                        });
                      }
                      return validationResult;
                    },
                    enabled: enableTextFormField,
                    autofocus: autofocus,
                    controller: textEditingController,
                    focusNode: focusNode
                      ..addListener(
                        () {
                          debugPrint('asdasd');
                          if (focusNode.hasFocus) {
                            openTextField.value = true;
                          } else {
                            openTextField.value = false;
                          }
                        },
                      ),
                    cursorHeight: textFormFieldCursorHeight ?? 25.0.h,
                    clipBehavior: Clip.hardEdge,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: onFieldSubmitted ??
                        (v) {
                          FocusScope.of(context).requestFocus(nextFocusNode);
                        },
                    maxLength: maxLength,
                    textDirection: textFormFieldDirection ?? TextDirection.ltr,
                    inputFormatters: textFormFieldFormatter ?? [],
                    textAlign: textAlign ?? TextAlign.start,
                    style: textStyle,
                    decoration: InputDecoration(
                        helperText: null,
                        hintText: null,
                        prefixText: '',
                        suffixText: '',
                        counterText: '',
                        errorStyle: errorTextStyle,
                        fillColor: fillColor ?? context.exPrimaryContainer,
                        contentPadding: contentPadding ??
                            HWEdgeInsetsDirectional.only(
                                start: 12, top: 0, bottom: 0, end: 2),
                        focusedErrorBorder: errorFocusedBorder ??
                            OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              // Set the border radius here
                              borderSide:
                                  BorderSide.none, // Hide the default border
                            ),
                        disabledBorder: disabledBorder ??
                            OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              // Set the border radius here
                              borderSide:
                                  BorderSide.none, // Hide the default border
                            ),
                        errorBorder: errorBorder ??
                            OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              // Set the border radius here
                              borderSide:
                                  BorderSide.none, // Hide the default border
                            ),
                        focusedBorder: focusedBorder ??
                            OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              // Set the border radius here
                              borderSide:
                                  BorderSide.none, // Hide the default border
                            ),
                        enabledBorder: enabledBorder ??
                            OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              // Set the border radius here
                              borderSide:
                                  BorderSide.none, // Hide the default border
                            ),
                        filled: true,
                        prefixIcon: prefixIcon,
                        suffixIcon: suffixIcon,
                        suffixIconConstraints: suffixIconConstraints,
                        // suffixIcon: suffixIcon,
                        label: value
                            ? const SizedBox.shrink()
                            : (textEditingController.text != ''
                                ? const SizedBox.shrink()
                                : label ?? const SizedBox.shrink()),
                        border: InputBorder.none),
                    onTap: onTap ??
                        () {
                          // focusNode.requestFocus();
                        },
                    scrollPadding: scrollPadding ?? const EdgeInsets.all(20),
                    onEditingComplete: () {
                      openTextField.value = false;
                    },
                    onTapOutside: onTapOutSideFunction ??
                        (event) {
                          focusNode.unfocus();
                        },
                    onChanged: onChange
                    // ??
                    //     (String? p0) {
                    //       if (formKey != null) {
                    //         formKey!.currentState!.validate();
                    //       }
                    //     }
                    ,
                  ),
                );
              },
            ));
  }
}

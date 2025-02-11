import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';

class CustomDropDownMenuWithTitle extends StatefulWidget {
  final List<DropdownMenuEntry> dropdownMenuEntries;
  final TextEditingController controller;
  final Widget? leadingIcon;
  final String title;
  final TextStyle? titleTextStyle;
  final bool? isTextFieldRequied;
  final FocusNode? focusNode;
  final ValueNotifier<bool> openTextField;
  final String? dropDownErrorText;
  const CustomDropDownMenuWithTitle(
      {super.key,
      this.dropDownErrorText,
      this.focusNode,
      this.titleTextStyle,
      required this.title,
      required this.openTextField,
      this.isTextFieldRequied = false,
      this.leadingIcon,
      required this.controller,
      required this.dropdownMenuEntries});

  @override
  State<CustomDropDownMenuWithTitle> createState() =>
      _CustomDropDownMenuWithTitleState();
}

class _CustomDropDownMenuWithTitleState
    extends State<CustomDropDownMenuWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        5.verticalSpace,
        widget.isTextFieldRequied == true
            ? Row(
                children: [
                  Text(
                    widget.title,
                    style: widget.titleTextStyle ??
                        context.exTextTheme.titleMedium!
                            .copyWith(color: context.exOnBackground),
                  ),
                  3.w.horizontalSpace,
                  // SvgPicture.string(
                  //   Asset.requiredSvg,
                  //   width: 5.w,
                  //   height: 5.h,
                  // ),
                ],
              )
            : Text(widget.title,
                style: widget.titleTextStyle ??
                    context.exTextTheme.titleMedium!
                        .copyWith(color: context.exOnBackground)),
        5.verticalSpace,
        ValueListenableBuilder(
          valueListenable: widget.openTextField,
          builder: (context, value, child) => TapRegion(
            onTapInside: (event) {
              setState(() {});
              widget.openTextField.value = !widget.openTextField.value;
            },
            child: DropdownMenu(
                errorText: widget.dropDownErrorText == null
                    ? null
                    : (widget.controller.text == ''
                        ? widget.dropDownErrorText
                        : null),
                enableSearch: false,
                width: 0.93.sw,
                hintText: widget.dropdownMenuEntries.isEmpty
                    ? 'no elements'
                    : 'choose element',
                inputDecorationTheme: InputDecorationTheme(
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: context.exPrimaryContainer),
                      borderRadius: BorderRadius.circular(12.r)),
                  constraints: BoxConstraints.tight(Size.fromHeight(
                      (widget.controller.text == '' &&
                              widget.openTextField.value &&
                              widget.isTextFieldRequied != null)
                          ? 80.h
                          : 45.h)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: context.exPrimaryContainer),
                      borderRadius: BorderRadius.circular(12.r)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: context.exPrimaryContainer),
                      borderRadius: BorderRadius.circular(12.r)),
                  contentPadding: EdgeInsetsDirectional.only(
                      bottom: 10.h, top: 10.h, start: 10.w),
                  isDense: true,
                  filled: true,
                  focusColor: context.exPrimaryContainer,
                  fillColor: context.exPrimaryContainer,
                ),
                onSelected: (dynamic s) {
                  widget.openTextField.value = !widget.openTextField.value;
                },
                trailingIcon: value
                    ? Icon(Icons.arrow_drop_down)
                    : Icon(Icons.arrow_drop_up),
                controller: widget.controller,
                dropdownMenuEntries: widget.dropdownMenuEntries),
          ),
        )
      ],
    );
  }
}

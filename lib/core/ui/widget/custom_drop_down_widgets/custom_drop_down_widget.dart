import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/core/ui/widget/custom_text_widget.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';
import 'package:pos_app/core/utils/extensions/widget_extensions.dart';

class CustomDropDownWidget<T> extends StatefulWidget {
  final String keys;
  final FocusNode nextFocus;
  final TextEditingController textEditingController;
  final double optionsContainerWidth;
  final Widget? dropDownArrowIcon;
  final Widget? dropUpArrowIcon;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final int? flex;

  final double optionsContainerHeight;
  final List<Widget> entires;
  final ValueNotifier<bool> openTextField;
  final BoxDecoration? boxDecoration;

  const CustomDropDownWidget({
    this.boxDecoration,
    this.margin,
    this.flex,
    this.padding,
    super.key,
    this.dropDownArrowIcon,
    this.dropUpArrowIcon,
    required this.entires,
    required this.openTextField,
    required this.optionsContainerHeight,
    required this.optionsContainerWidth,
    required this.nextFocus,
    required this.textEditingController,
    required this.keys,
  });
  @override
  CustomDropDownWidgetState createState() => CustomDropDownWidgetState();
}

class CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  static FocusNode focusNode = FocusNode();
  static bool isInTheEndExpanded = false;

  CustomDropDownWidgetState();

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      child: ValueListenableBuilder(
        valueListenable: widget.openTextField,
        builder: (context, value, child) => AnimatedContainer(
          onEnd: () {
            setState(() {
              isInTheEndExpanded = !isInTheEndExpanded;
            });
          },
          decoration: BoxDecoration(
              color: context.exPrimaryContainer,
              borderRadius: BorderRadius.circular(10.h)),
          duration: Duration(milliseconds: 400),
          width: 1.sw,
          height:
              widget.openTextField.value ? widget.optionsContainerHeight : 40.h,
          child: Column(
            children: [
              Flexible(
                  flex: 2,
                  child: Container(
                    width: 1.sw,
                    height: 40.h,
                    padding: EdgeInsets.only(left: 10.w, right: 15.w),
                    alignment: Alignment.centerLeft,
                    decoration: widget.boxDecoration ??
                        BoxDecoration(
                            // border: widget.border,
                            color: context.exPrimaryContainer,
                            borderRadius: BorderRadius.circular(10.h)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                            style: context.exTextTheme.bodyLarge!
                                .copyWith(color: context.exOnBackground),
                            content: widget.textEditingController.text == ''
                                ? 'Choose'
                                : widget.textEditingController.text),

                        isInTheEndExpanded
                            ? widget.dropUpArrowIcon ??
                                Icon(
                                  Icons.arrow_drop_up,
                                )
                            // .directionalPadding(
                            // HWEdgeInsetsDirectional.only(end: 20))
                            : widget.dropDownArrowIcon ??
                                Icon(Icons.arrow_drop_down)
                        // .directionalPadding(
                        //   HWEdgeInsetsDirectional.only(end: 15)),
                      ],
                    ),
                  ).onTap(() {
                    widget.openTextField.value = !widget.openTextField.value;
                  })),
              value
                  ? Flexible(
                      flex: widget.flex ?? 5,
                      child: Container(
                        margin: widget.margin ??
                            EdgeInsets.only(
                              top: 10.h,
                            ),
                        padding: widget.padding ??
                            EdgeInsets.only(
                                top: 10.h,
                                right: 10.h,
                                left: 10.h,
                                bottom: 5.h),
                        width: 1.sw,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.h),
                            color: context.exBackground,
                            border: Border.all(
                              color: context.exOnPrimaryContainer,
                            )),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.entires,
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

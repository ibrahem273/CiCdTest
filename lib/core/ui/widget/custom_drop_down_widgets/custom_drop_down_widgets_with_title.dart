import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/core/ui/widget/custom_drop_down_widgets/custom_drop_down_widget.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';

class CustomDropDownWidgetWithTitle extends StatefulWidget {
  final String title;
  final String keys;
  final FocusNode nextFocus;
  final TextEditingController textEditingController;
  final double optionsContainerWidth;
  final double optionsContainerHeight;
  final List<Widget> entires;
  final Widget? dropDownArrowIcon;
  final Widget? dropUpArrowIcon;
  final EdgeInsets? margin;
  final int? flex;

  final EdgeInsets? padding;
  final ValueNotifier<bool> openTextField;
  final BoxDecoration? boxDecoration;
  const CustomDropDownWidgetWithTitle({
    super.key,
    this.flex,
    this.padding,
    this.margin,
    this.dropDownArrowIcon,
    this.dropUpArrowIcon,
    this.boxDecoration,
    required this.title,
    required this.entires,
    required this.openTextField,
    required this.optionsContainerHeight,
    required this.optionsContainerWidth,
    required this.nextFocus,
    required this.textEditingController,
    required this.keys,
  });
  @override
  CustomDropDownWidgetWithTitleState createState() =>
      CustomDropDownWidgetWithTitleState();
}

class CustomDropDownWidgetWithTitleState
    extends State<CustomDropDownWidgetWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        Text(widget.title,
            style: context.exTextTheme.bodyLarge!
                .copyWith(fontSize: 14.h, color: context.exOnBackground)),
        10.verticalSpace,
        CustomDropDownWidget(
          flex: widget.flex,
          margin: widget.margin,
          padding: widget.padding,
          dropDownArrowIcon: widget.dropDownArrowIcon,
          dropUpArrowIcon: widget.dropUpArrowIcon,
          boxDecoration: widget.boxDecoration,
          openTextField: widget.openTextField,
          entires: widget.entires,
          optionsContainerHeight: widget.optionsContainerHeight,
          optionsContainerWidth: widget.optionsContainerWidth,
          nextFocus: widget.nextFocus,
          textEditingController: widget.textEditingController,
          keys: '',
        ),
      ],
    );
  }
}

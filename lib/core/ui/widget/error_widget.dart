import 'package:flutter/material.dart';
import 'package:pos_app/core/ui/widget/custom_container_button_widget.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({
    super.key,
    required this.onTap,
    this.color,
    this.textColor,
  });

  final void Function() onTap;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomContainerButtonWidget(
          text: '',
          backgroundColor: context.exErorr,
          onPress: onTap,
          containerChild: Text('try again',
              style: context.exTextTheme.bodyMedium!
                  .copyWith(color: context.exBackground)),
          border: 10,
          borderColor: context.exErorr,
          textStyle: context.exTextTheme.bodyMedium!
              .copyWith(color: context.exBackground),
        ),
      ],
    );
  }
}

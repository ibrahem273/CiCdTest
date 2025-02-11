import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/core/resources/type_defs.dart';
import 'package:pos_app/core/ui/responsive_padding.dart';
import 'package:pos_app/core/ui/widget/custom_text_field.dart';
import 'package:pos_app/core/ui/widget/reponsive_loader_widget.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';
import 'package:pos_app/core/utils/extensions/widget_extensions.dart';

class CustomDropDownSearchWidget<T> extends StatefulWidget {
  final String keys;
  final VoidFromJson<T>? fromJson;
  final FocusNode nextFocus;
  final String keyOfTheSelectedId;
  final TextEditingController textEditingController;
  final String keyOfValueViewdAsResult;
  final int lengthOfParameterSearch;
  const CustomDropDownSearchWidget({
    super.key,
    required this.nextFocus,
    required this.fromJson,
    required this.keyOfTheSelectedId,
    required this.textEditingController,
    required this.lengthOfParameterSearch,
    required this.keys,
    required this.keyOfValueViewdAsResult,
  });
  @override
  CustomDropDownSearchWidgetState createState() =>
      CustomDropDownSearchWidgetState(
        keyOfTheSelectedId: keyOfTheSelectedId,
        textEditingController: textEditingController,
        keyOfValueViewdAsResult: keyOfValueViewdAsResult,
        lengthOfParameterSearch: lengthOfParameterSearch,
        keys: keys,
      );
}

class CustomDropDownSearchWidgetState
    extends State<CustomDropDownSearchWidget> {
  TextEditingController textEditingController;
  static FocusNode focusNode = FocusNode();
  static bool isInTheEndExpanded = false;
  late List<String> searchParametervalues;
  String keyOfValueViewdAsResult;
  String keyOfTheSelectedId;

  static ValueNotifier<bool> openTextField = ValueNotifier(false);
  int lengthOfParameterSearch;
  String keys;
  CustomDropDownSearchWidgetState({
    required this.lengthOfParameterSearch,
    required this.keys,
    required this.keyOfTheSelectedId,
    required this.textEditingController,
    required this.keyOfValueViewdAsResult,
  }) {
    searchParametervalues = List.filled(lengthOfParameterSearch, '');
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      child: ValueListenableBuilder(
        valueListenable: openTextField,
        builder: (context, value, child) => AnimatedContainer(
          onEnd: () {
            setState(() {
              isInTheEndExpanded = !isInTheEndExpanded;
            });
          },
          decoration: BoxDecoration(
              color: context.exPrimaryContainer,
              borderRadius: BorderRadius.circular(12.h)),
          duration: Duration(milliseconds: 400),
          width: 380.w,
          height: openTextField.value ? 200.h : 40.h,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: CustomTextFiledWidget(
                  onTapOutSideFunction: (p0) {},
                  scrollPadding:
                      EdgeInsets.only(right: 0, top: 0, bottom: 160.h, left: 0),
                  suffixIconConstraints:
                      BoxConstraints(maxWidth: 16.h, maxHeight: 16.h),
                  onChange: (p0) {
                    searchParametervalues =
                        List.filled(searchParametervalues.length, "$p0%");

                    setState(() {});
                  },
                  suffixIcon: isInTheEndExpanded
                      ? Icon(Icons.arrow_drop_down).onTap(() {
                          focusNode.unfocus();
                        })
                      : Icon(Icons.arrow_drop_up).onTap(() {
                          focusNode.unfocus();
                        }).onTap(() {
                          focusNode.requestFocus();
                        }),
                  label: Text(
                    'choose element',
                    style: context.exTextTheme.bodyMedium!.copyWith(
                        fontSize: 14.h, color: context.exOnBackground),
                  ),
                  onTap: () {
                    focusNode.requestFocus();
                  },
                  focusNode: focusNode,
                  textEditingController: textEditingController,
                  textFieldValidator: (p0) {
                    return null;
                  },
                  openTextField: openTextField,
                  nextFocusNode: widget.nextFocus,
                ),
              ),
              value
                  ? Flexible(
                      flex: 4,
                      child: Container(
                        color: context.exBackground,
                        width: 380.w,
                        height: 200.h,
                        child: FutureBuilder(
                          future: Future.value(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return ResponsiveLoaderWidget();
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              debugPrint(snapshot.data.toString());
                              return snapshot.data == null
                                  ? Expanded(
                                      child: Center(
                                      child: Text('coming soon'),
                                    ))
                                  : ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          10.verticalSpace,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        return index == 0
                                            ? Row(
                                                children: [
                                                  Text(
                                                      '$index ${snapshot.data![index][keyOfValueViewdAsResult]}')
                                                ],
                                              ).onTap(() {
                                                textEditingController.text =
                                                    '${snapshot.data![index][keyOfValueViewdAsResult]}';

                                                focusNode.unfocus();
                                                widget.fromJson!(
                                                    snapshot.data![index]);
                                              }).directionalPadding(
                                                HWEdgeInsetsDirectional.only(
                                                    top: 5))
                                            : Row(
                                                children: [
                                                  Text(
                                                      '$index ${snapshot.data![index][keyOfValueViewdAsResult]}')
                                                ],
                                              ).onTap(() {
                                                textEditingController.text =
                                                    '${snapshot.data![index][keyOfValueViewdAsResult]}';

                                                focusNode.unfocus();
                                                widget.fromJson!(
                                                    snapshot.data![index]);
                                              });
                                      },
                                    );
                            }
                            return Container();
                          },
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

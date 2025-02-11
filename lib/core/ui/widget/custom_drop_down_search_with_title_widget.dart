import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pos_app/core/const/configuration/ServerEndPoints.dart';
import 'package:pos_app/core/resources/type_defs.dart';
import 'package:pos_app/core/ui/responsive_padding.dart';
import 'package:pos_app/core/ui/widget/custom_text_field.dart';
import 'package:pos_app/core/ui/widget/reponsive_loader_widget.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';
import 'package:pos_app/core/utils/extensions/widget_extensions.dart';

class CustomDropDownSearchWidgetWithTitle<T> extends StatefulWidget {
  final String keys;
  final String title;
  final TextStyle textStyle;
  final VoidCallback? onTapAction;
  final VoidFromJson<T>? fromJson;
  final FocusNode nextFocus;
  final FocusNode focusNode;
  final ValueNotifier<bool> openTextField;
  final String keyOfTheSearchElement;
  final String keyOfTheSelectedId;
  final TextEditingController textEditingController;
  final String keyOfValueViewdAsResult;
  final Color? fillColor;
  final int lengthOfParameterSearch;
  final Map<String, dynamic> queryParameters;
  final String endPoint;
  final BoxDecoration? decoration;
  final ValueNotifier<int?> selectedId;
  final StringFunctionTypeDef? textFieldValidator;
  final Widget? dropDownArrowIcon;
  final Widget? dropUpArrowIcon;
  const CustomDropDownSearchWidgetWithTitle({
    this.dropDownArrowIcon,
    this.dropUpArrowIcon,
    this.onTapAction,
    this.decoration,
    this.fillColor,
    required this.textStyle,
    required this.textFieldValidator,
    required this.openTextField,
    required this.selectedId,
    super.key,
    this.keyOfTheSearchElement = '',
    this.queryParameters = const {},
    this.endPoint = '',
    required this.focusNode,
    required this.title,
    required this.nextFocus,
    required this.fromJson,
    required this.keyOfTheSelectedId,
    required this.textEditingController,
    required this.lengthOfParameterSearch,
    required this.keys,
    required this.keyOfValueViewdAsResult,
  });
  @override
  CustomDropDownSearchWidgetWithTitleState createState() =>
      // ignore: no_logic_in_create_state
      CustomDropDownSearchWidgetWithTitleState<T>(
        keyOfTheSelectedId: keyOfTheSelectedId,
        textEditingController: textEditingController,
        keyOfValueViewdAsResult: keyOfValueViewdAsResult,
        lengthOfParameterSearch: lengthOfParameterSearch,
        keys: keys,
      );
}

class CustomDropDownSearchWidgetWithTitleState<T>
    extends State<CustomDropDownSearchWidgetWithTitle> {
  TextEditingController textEditingController;
  static bool isInTheEndExpanded = false;
  late List<String> searchParametervalues;
  String keyOfValueViewdAsResult;
  String keyOfTheSelectedId;

  final baseUri = Uri.parse(ServerUrls.baseUrl);
  final client = GetIt.I<Dio>();
  late final Future<dynamic> response;
  int lengthOfParameterSearch;
  String keys;
  CustomDropDownSearchWidgetWithTitleState({
    required this.lengthOfParameterSearch,
    required this.keys,
    required this.keyOfTheSelectedId,
    required this.textEditingController,
    required this.keyOfValueViewdAsResult,
  });
  final ScrollController _controller = ScrollController();

  int page = 1;
  bool isEndThePagination = true;
  @override
  void initState() {
    _controller.addListener(() async {
      if ((_controller.position.maxScrollExtent - _controller.position.pixels) <
          75) {
        if (isEndThePagination) {
          isEndThePagination = false;

          page = page + 1;

          widget.queryParameters["page"] = page.toString();
          await Future.delayed(Duration(seconds: 1));
          isEndThePagination = true;

          setState(() {});
        }
      }
    });

    super.initState();
  }

  List<dynamic> result = List.of([]);

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
        TapRegion(
          onTapInside: (event) {
            debugPrint("inseidd");
          },
          onTapOutside: (event) {
            // debugPrint("asldjnasd");
            if (widget.focusNode.hasFocus) {
              debugPrint("tite${widget.title}");
              widget.focusNode.unfocus();
            }
          },
          child: ValueListenableBuilder(
            valueListenable: widget.openTextField,
            builder: (context, value, child) => AnimatedContainer(
              onEnd: () {
                setState(() {
                  isInTheEndExpanded = !isInTheEndExpanded;
                  result = [];
                  page = 1;
                });
              },
              decoration: widget.decoration ??
                  BoxDecoration(
                      color: context.exPrimaryContainer,
                      borderRadius: BorderRadius.circular(12.h)),
              duration: Duration(milliseconds: 400),
              width: 380.w,
              height: value ? 200.h : 45.h,
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: CustomTextFiledWidget(
                      fillColor: widget.fillColor,
                      textStyle: widget.textStyle,
                      onTapOutSideFunction: (p0) {},
                      scrollPadding: EdgeInsets.only(
                          right: 0, top: 0, bottom: 160.h, left: 0),
                      // suffixIconConstraints:
                      //     BoxConstraints(maxWidth: 60.w, maxHeight: 40.h),
                      onChange: (p0) {
                        widget.queryParameters['name'] = p0;

                        widget.queryParameters["page"] = "1";
                        page = 1;
                        result = [];

                        setState(() {});
                      },
                      suffixIcon: isInTheEndExpanded
                          ? widget.dropDownArrowIcon != null
                              ? widget.dropDownArrowIcon!.onTap(() {
                                  widget.focusNode.unfocus();
                                }).directionalPadding(
                                  HWEdgeInsetsDirectional.only(end: 15))
                              : Icon(Icons.arrow_drop_down).onTap(() {
                                  widget.focusNode.unfocus();
                                }).directionalPadding(
                                  HWEdgeInsetsDirectional.only(end: 15))
                          : widget.dropUpArrowIcon != null
                              ? widget.dropUpArrowIcon!.onTap(() {
                                  widget.focusNode.unfocus();
                                }).directionalPadding(
                                  HWEdgeInsetsDirectional.only(end: 15))
                              : Icon(
                                  Icons.arrow_drop_up,
                                )
                                  .onTap(() {
                                    widget.focusNode.unfocus();
                                  })
                                  .onTap(() {})
                                  .directionalPadding(
                                      HWEdgeInsetsDirectional.only(end: 15)),
                      label: Text(
                        'Choose',
                        style: context.exTextTheme.bodyLarge!.copyWith(
                            fontSize: 14.h, color: context.exOnBackground),
                      ),
                      onTap: () {
                        // widget.focusNode.requestFocus();
                      },
                      focusNode: widget.focusNode,
                      textEditingController: textEditingController,
                      textFieldValidator: widget.textFieldValidator,
                      openTextField: widget.openTextField,
                      nextFocusNode: widget.nextFocus,
                    ),
                  ),
                  value
                      ? Flexible(
                          flex: 6,
                          child: Container(
                            width: 380.w,
                            height: 200.h,
                            decoration: BoxDecoration(
                                color: context.exBackground,
                                border: Border.all(
                                    color: context.exOnPrimaryContainer)),
                            child: FutureBuilder(
                              future: client.getUri(
                                Uri(
                                  host: baseUri.host,
                                  scheme: baseUri.scheme,
                                  path: widget.endPoint,
                                  queryParameters: widget.queryParameters,
                                ),
                              ),
                              builder: (context, snapshot) {
                                if (result.isEmpty) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return ResponsiveLoaderWidget();
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    // Toaster
                                    return snapshot.data == null
                                        ? Center(
                                            child: Text('try again'),
                                          )
                                        : () {
                                            Map<String, dynamic> data = snapshot
                                                .data!
                                                .data as Map<String, dynamic>;

                                            List<dynamic> info = data['data'];

                                            result = [...info];

                                            return ListView.separated(
                                              controller: _controller,
                                              separatorBuilder:
                                                  (context, index) =>
                                                      10.verticalSpace,
                                              itemCount: result.length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  padding: index == 0
                                                      ? EdgeInsets.only(
                                                          top: 10.h)
                                                      : null,
                                                  // color: Colors.red,
                                                  // padding:
                                                  //     EdgeInsets.only(top: 5.h),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '${result[index][keyOfValueViewdAsResult]}',
                                                            style: context
                                                                .exTextTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                    color: context
                                                                        .exOnBackground),
                                                          )
                                                        ],
                                                      ),
                                                      Divider(
                                                        color: Colors.grey,
                                                        // height: 1.sw,
                                                      )
                                                    ],
                                                  ),
                                                ).onTap(() {
                                                  widget.onTapAction?.call();
                                                  widget.textEditingController
                                                      .text = result[
                                                          index]
                                                      [keyOfValueViewdAsResult];
                                                  widget.selectedId.value =
                                                      result[index]['id'];

                                                  setState(() {});

                                                  widget.focusNode.unfocus();
                                                });
                                              },
                                            );
                                          }();
                                  }
                                  return Container();
                                } else {
                                  return Column(
                                    children: [
                                      Expanded(
                                        child: ListView.separated(
                                          controller: _controller,
                                          separatorBuilder: (context, index) =>
                                              10.verticalSpace,
                                          itemCount: result.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding: index == 0
                                                  ? EdgeInsets.only(top: 10.h)
                                                  : null,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '${result[index][keyOfValueViewdAsResult]}',
                                                        style: widget.textStyle,
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    color: Colors.grey,
                                                    // height: 1.sw,
                                                  )
                                                ],
                                              ).onTap(() {
                                                widget.onTapAction?.call();
                                                widget.textEditingController
                                                    .text = result[
                                                        index]
                                                    [keyOfValueViewdAsResult];
                                                widget.selectedId.value =
                                                    result[index]['id'];

                                                setState(() {});

                                                widget.focusNode.unfocus();
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                      () {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return ResponsiveLoaderWidget();
                                        } else if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          Map<String, dynamic> data = snapshot
                                              .data!
                                              .data as Map<String, dynamic>;

                                          List<dynamic> info = data['data'];

                                          result = [...result, ...info];

                                          return SizedBox.shrink();
                                        }
                                        return SizedBox.shrink();
                                      }()
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

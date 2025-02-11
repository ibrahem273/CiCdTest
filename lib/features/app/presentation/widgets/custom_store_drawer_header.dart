import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_app/core/ui/responsive_padding.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';
import 'package:pos_app/core/utils/extensions/widget_extensions.dart';

class CustomStoreDrawerHeader extends StatefulWidget {
  final String title;
  late final GlobalKey<ScaffoldState> _scaffoldKey;

//   get getScaffoldKey => this._scaffoldKey;

//  set scaffoldKey(late value) => this._scaffoldKey = value;

  CustomStoreDrawerHeader(
      {super.key,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required this.title}) {
    _scaffoldKey = scaffoldKey;
  }
  @override
  _CustomStoreDrawerHeaderState createState() =>
      _CustomStoreDrawerHeaderState();
}

class _CustomStoreDrawerHeaderState extends State<CustomStoreDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 594.w,
      height: 60.h,
      margin: EdgeInsets.all(4.h),
      decoration: const BoxDecoration(boxShadow: [
        // BoxShadow(blurRadius: 10, offset: Offset(1, 1), color: Colors.black)
      ], color: Colors.blue),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Center(
              child: Text(
                widget.title,
                style: context.exTextTheme.displayMedium!
                    .copyWith(color: context.exBackground),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          )
              .directionalPadding(HWEdgeInsetsDirectional.only(start: 15.w))
              .onTap(() => context.pop())
        ],
      ),
    );
  }
}

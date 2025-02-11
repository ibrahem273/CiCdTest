import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';
import 'package:pos_app/core/utils/extensions/widget_extensions.dart';

class CustomDrawerHeader extends StatefulWidget {
  final String title;
  late final GlobalKey<ScaffoldState> _scaffoldKey;

  VoidCallback? onTapSearchIcon;
//   get getScaffoldKey => this._scaffoldKey;

//  set scaffoldKey(late value) => this._scaffoldKey = value;

  CustomDrawerHeader(
      {super.key,
      this.onTapSearchIcon,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required this.title}) {
    _scaffoldKey = scaffoldKey;
  }
  @override
  _CustomDrawerHeaderState createState() => _CustomDrawerHeaderState();
}

class _CustomDrawerHeaderState extends State<CustomDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25.h,
          backgroundColor: context.exPrimaryContainer,
          child: Center(
              child: SvgPicture.asset(
            'Assets.drawerSvg',
            height: 24.h,
            width: 24.h,
            color: Colors.black,
          )),
        ).onTap(() {
          debugPrint("asdasd");
          widget._scaffoldKey.currentState?.openDrawer();
        }),
        Center(
          child: Text(
            widget.title,
            style: context.exTextTheme.displayMedium!
                .copyWith(color: context.exOnBackground),
          ),
        ),
        CircleAvatar(
          radius: 25.h,
          backgroundColor: context.exPrimaryContainer,
          child: Center(
              child: SvgPicture.asset(
            'Assets.searchSvg',
            height: 24.h,
            width: 24.h,
          )),
        ).onTap(widget.onTapSearchIcon),
      ],
    );
  }
}

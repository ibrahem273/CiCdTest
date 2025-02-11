import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';
import 'package:pos_app/core/utils/extensions/widget_extensions.dart';

class DrawerHederWithoutSearch extends StatefulWidget {
  final String title;
  late final GlobalKey<ScaffoldState> _scaffoldKey;

  DrawerHederWithoutSearch(
      {super.key,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required this.title}) {
    _scaffoldKey = scaffoldKey;
  }
  @override
  _DrawerHederWithoutSearchState createState() =>
      _DrawerHederWithoutSearchState();
}

class _DrawerHederWithoutSearchState extends State<DrawerHederWithoutSearch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 40.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              radius: 25.h,
              backgroundColor: context.exPrimaryContainer,
              child: Center(
                  child: SvgPicture.asset(
                ' Assets.drawerSvg',
                height: 24.h,
                width: 24.h,
                color: Colors.black,
              )),
            ).onTap(() {
              widget._scaffoldKey.currentState?.openDrawer();
            }),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: context.exTextTheme.displayMedium!
                  .copyWith(color: context.exOnBackground),
            ),
          ),
        ],
      ),
    );

    // Row(
    //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     CircleAvatar(
    //       radius: 25.h,
    //       backgroundColor: context.exPrimaryContainer,
    //       child: Center(
    //           child: SvgPicture.asset(
    //         Assets.drawerSvg,
    //         height: 24.h,
    //         width: 24.h,
    //         color: Colors.black,
    //       )),
    //     ).onTap(() {
    //       debugPrint("asdasd");
    //       widget._scaffoldKey.currentState?.openDrawer();
    //     }),
    //     Center(
    //       child: Text(
    //         widget.title,
    //         style: context.exTextTheme.displayMedium!
    //             .copyWith(color: context.exOnBackground),
    //       ),
    //     ),
    //   ],
    // );
  }
}

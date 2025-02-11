// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:pos_app/core/resources/assets.dart';
// import 'package:pos_app/core/ui/widget/custom_text_widget.dart';
// import 'package:pos_app/core/utils/extensions/widget_extensions.dart';

// class BackwardHeader extends StatelessWidget {
//   final String title;
//   final VoidCallback? onTap;
//   const BackwardHeader({this.onTap, required this.title, super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 25.h,
//           height: 25.h,
//           child: SvgPicture.asset(
//             fit: BoxFit.none,
//             width: 15.h,
//             height: 15.h,
//             SvgAssets.backArrow,
//           ),
//         ),
//         10.horizontalSpace,
//         CustomTextWidget(
//           content: title,
//         )
//       ],
//     ).onTap(onTap ??
//         () {
//           context.pop();
//         });
//   }
// }

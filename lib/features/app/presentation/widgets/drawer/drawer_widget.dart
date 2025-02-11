// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get_it/get_it.dart';
// import 'package:pos_app/core/domain/prefs_repository.dart';
// import 'package:pos_app/core/resources/assets.dart';
// import 'package:pos_app/core/utils/extensions/context_extensions.dart';
// import 'package:pos_app/core/utils/extensions/widget_extensions.dart';
// import 'package:pos_app/features/app/presentation/helpers/app_common_helpers.dart';
// import 'package:pos_app/features/app/presentation/widgets/drawer/drawer_tile_widget.dart';

// class DrawerWidget extends StatefulWidget {
//   String? mainScreenRoute;

//   GlobalKey<ScaffoldState>? ownerScaffoldKey;
//   DrawerWidget({this.ownerScaffoldKey, this.mainScreenRoute, super.key});

//   @override
//   _DrawerWidgetState createState() => _DrawerWidgetState();
// }

// class _DrawerWidgetState extends State<DrawerWidget> {
//   List<({String svgAsset, String title, String path})> drawerTilesElements = [
//     (
//       svgAsset: Assets.disActiveNavBarHomeSvgIcon,
//       title: 'الرئيسية',
//       path: AppCommonHelpers.getRouteForTheMainScreenWithNavBar(
//           userType: GetIt.I<PrefsRepository>().getUserType!)
//     ),
//     (svgAsset: Assets.searchStringSvg, title: 'البحث', path: ''),
//     (svgAsset: Assets.addEmploye, title: 'إضافة موظف', path: '/add_employe'),
//     (svgAsset: Assets.addOreder, title: 'إضافة طلب', path: '/add_order'),
//     (svgAsset: Assets.storeSvg, title: 'المخزن', path: '/store_points'),
//     (svgAsset: Assets.disclosuresSvg, title: 'الكشوفات', path: '/disclosures'),
//     (
//       svgAsset: Assets.debenturesSvg,
//       title: 'السندات',
//       path: '/debenture_points'
//     ),
//     (svgAsset: Assets.whatsAppSvg, title: 'ه خدمة العملاء', path: ''),
//     (svgAsset: Assets.whatsAppSvg, title: 'ه الشكاوي', path: ''),
//     (svgAsset: Assets.aboutSvg, title: 'حول', path: ''),
//     (svgAsset: Assets.signOutSvg, title: 'تسجيل الخروج', path: ''),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10.h),
//                 topLeft: Radius.circular(10.h)),
//             color: context.exBackground),
//         width: 221.w,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             10.verticalSpace,
//             SvgPicture.asset(
//               Assets.loveAndCooperationLogoAsset,
//               width: 123.w,
//               height: 102.h,
//             ),
//             25.verticalSpace,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text(
//                   GetIt.I<PrefsRepository>().getUserName!,
//                   style: context.exTextTheme.bodyMedium!
//                       .copyWith(color: context.exOnBackground),
//                 ),
//                 Text(GetIt.I<PrefsRepository>().getUserType!,
//                     style: context.exTextTheme.bodyMedium!
//                         .copyWith(color: context.exOnBackground)),
//               ],
//             ),
//             25.verticalSpace,
//             ...drawerTilesElements.map((e) {
//               if (e.title == 'إضافة موظف' &&
//                   GetIt.I<PrefsRepository>().getUserType != 'رئيس مجموعة') {
//                 return const SizedBox.shrink();
//               }
//               if ((e.title == 'إضافة طلب') &&
//                   GetIt.I<PrefsRepository>().getUserType != 'عميل') {
//                 return const SizedBox.shrink();
//               }

//               return DrawerTileWidget(
//                 mainScreenScaffoldKey: widget.ownerScaffoldKey,
//                 mainScreenPath: widget.mainScreenRoute,
//                 path: e.path,
//                 title: e.title,
//                 svgAsset: e.svgAsset,
//               );
//             }).toList()
//           ],
//         ).pagePadding());
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get_it/get_it.dart';
// import 'package:go_router/go_router.dart';
// import 'package:pos_app/core/domain/prefs_repository.dart';
// import 'package:pos_app/core/enums/response_status.dart';
// import 'package:pos_app/core/resources/assets.dart';
// import 'package:pos_app/core/utils/extensions/context_extensions.dart';
// import 'package:pos_app/core/utils/extensions/widget_extensions.dart';
// import 'package:pos_app/core/utils/helpers/url_launcher_helper.dart';
// import 'package:pos_app/features/app/presentation/blocs/app_bloc/app_bloc.dart';

// class DrawerTileWidget extends StatelessWidget {
//   String svgAsset;
//   String path;
//   GlobalKey<ScaffoldState>? mainScreenScaffoldKey;

//   String? mainScreenPath;
//   String title;
//   DrawerTileWidget(
//       {this.mainScreenScaffoldKey,
//       this.mainScreenPath,
//       required this.path,
//       required this.title,
//       required this.svgAsset,
//       super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.all(5.h),
//         clipBehavior: Clip.hardEdge,
//         decoration: BoxDecoration(
//             color: context.exPrimaryContainer,
//             borderRadius: BorderRadius.circular(20.h)),
//         width: 205.w,
//         height: 38.h,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             5.horizontalSpace,
//             SvgPicture.string(
//               svgAsset,
//               height: 18.h,
//               width: 18.h,
//               color: context.exOnBackground,
//             ),
//             10.horizontalSpace,
//             Text(
//               title,
//               style: context.exTextTheme.titleMedium!
//                   .copyWith(fontSize: 12.h, color: Colors.black),
//             ),
//             Expanded(
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: SvgPicture.asset(
//                   Assets.loveAndCooperationDesignDrawerTileAsset,
//                   width: 46.w,
//                   height: 23.94.h,
//                 ),
//               ),
//             ),
//           ],
//         )).onTap(() async {
//       if (title == 'ه خدمة العملاء' || title == 'ه الشكاوي') {
//         await UrlLauncherHelper.launchWhatApp(
//             number: GetIt.I<PrefsRepository>().whatsAppNumber ?? '');
//         return;
//       }

//       if (title == 'حول') {
//         context.push('/about');
//         return;
//       }

//       if (title == 'البحث') {
//         // GetIt.I<HomeBloc>().add(SearchSubjectsEvent(
//         //     params: GetUnverifiedParams(
//         //         userId: GetIt.I<PrefsRepository>().getUserId!,
//         //         ageentPaid: false,
//         //         restoreArchive: false,
//         //         delegatePaid: false,
//         //         deliveredArchive: false,
//         //         getorderStatus: ResponseStatus.loading,
//         //         pageNumber: 1,
//         //         isTotal: false,
//         //         paginationStatus: ResponseStatus.init,
//         //         status: 'غير مؤكد')));

//         Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => SearchSubjectScreen(
//               userId: GetIt.I<PrefsRepository>().getUserId!, title: 'مدير فرق'),
//         ));

//         return;
//       }

//       //  if (title == 'حول') {
//       //       GetIt.I<AuthBloc>().add(LogoutEvent());
//       //       return;
//       //     }

//       if (title == 'تسجيل الخروج') {
//         GetIt.I<AuthBloc>().add(LogoutEvent());
//         return;
//       }

//       if (title == 'الكشوفات') {
//         GetIt.I<HomeBloc>().add(GetStatementsEvent(
//             params: GetStatementsParams(
//           getStatementsStatus: ResponseStatus.loading,
//           paginationStatus: ResponseStatus.init,
//           pageNumber: 1,
//           // id: theUserIdOfTheCurrentScreen
//           // userId: theUserIdOfTheCurrentScreen,
//           // isTotal: false,
//         )));
//       }
//       if (title == "المخزن") {
//         GetIt.I<HomeBloc>().add(SearchSubjectEvent(
//             params: SearchOnSubjectParams(
//                 pageNumber: 1,
//                 getMaterialStatus: ResponseStatus.loading,
//                 paginationStatus: ResponseStatus.init,
//                 name: '')));
//       }

//       if (title == 'إضافة طلب') {
//         GetIt.I<HomeBloc>().add(GetAreaEvent(
//             params: GetArearParams(
//           name: '',
//           pageNumber: 1,
//           getAreaStatus: ResponseStatus.loading,
//           paginationStatus: ResponseStatus.init,
//         )));

//         GetIt.I<HomeBloc>().add(SearchSubjectEvent(
//             params: SearchOnSubjectParams(
//                 pageNumber: 1,
//                 getMaterialStatus: ResponseStatus.loading,
//                 paginationStatus: ResponseStatus.init,
//                 name: '')));
//       }
//       if (title == 'السندات') {
//         GetIt.I<HomeBloc>().add(GetPointsEvent(
//             params: GetPointsParams(
//           userId: GetIt.I<PrefsRepository>().getUserId!,
//           getPointsStatus: ResponseStatus.loading,
//           paginationStatus: ResponseStatus.init,
//           pageNumber: 1,
//           isTotal: false,
//         )));
//       }
//       debugPrint('mainScreenPath');
//       debugPrint(path);
//       // context.popUntil(destination: path);
//       debugPrint("mainScreenPath$mainScreenPath");

//       debugPrint("mainScreenScaffoldKey$mainScreenScaffoldKey");
//       if (mainScreenScaffoldKey != null && title == 'الرئيسية') {
//         debugPrint("))))asd");
//         mainScreenScaffoldKey!.currentState!.closeDrawer();
//       }

//       if (mainScreenPath == path && title == 'الرئيسية') {
//         debugPrint(mainScreenPath);
//         debugPrint(path);

//         debugPrint("*****");
//       } else if (mainScreenPath != path && title == 'الرئيسية') {
//         GetIt.I<AppBloc>()
//             .add(ChangeFullShellNavigationPageEvent(pageIndex: 0));
//         debugPrint("ppkapsidsa");
//         context.popUntil(destination: path);
//       } else if (mainScreenPath != path) {
//         debugPrint("push");
//         context.push(path);
//       }
//     });
//   }
// }

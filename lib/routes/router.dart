import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_app/core/enums/response_status.dart';
import 'package:pos_app/routes/route_observer.dart';
import 'package:pos_app/routes/router_config.dart';

class GRouter {
// SplashScreen

  // static final GoRoute splash = GoRoute(
  //     path: GRouter.config.applicationRoutes.kSplash,
  //     parentNavigatorKey: rootNavigatorKey,
  //     routes: const [],
  //     pageBuilder: (context, state) =>
  //         _buildFidePage(child: const SplashScreen(), state: state));

  static Page<dynamic> _buildFidePage<T>(
      {required Widget child, required GoRouterState state}) {
    return CustomTransitionPage(
      child: child,
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(
            curve: Curves.easeInOutCirc,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  static Page<dynamic> _buildSliderPage<T>(
      {required Widget child, required GoRouterState state}) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static final RouterConfiguration _config = RouterConfiguration.init();

  static RouterConfiguration get config => _config;

  static GoRouter get router => _router;
  static final bottonNavigatorKey = GlobalKey<NavigatorState>();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
      observers: [appRouteObserver],
      navigatorKey: rootNavigatorKey,
      redirect: (context, state) {
        return null;
      },
      initialLocation: GRouter.config.applicationRoutes.kSplash
      //  (GetIt.I<PrefsRepository>().serverToken == '' ||
      //         GetIt.I<PrefsRepository>().serverToken == null)
      //     ? '/login'
      //     : () {
      // if (GetIt.I<PrefsRepository>().getUserType! == 'عميل') {
      //   GetIt.I<HomeBloc>().add(GetMainInfoScreenEvent());
      //   GetIt.I<HomeBloc>().add(GetNotificationsEvent(
      //       params: GetNotificationsParams(
      //           getNotifications: ResponseStatus.loading,
      //           pageNumber: 1,
      //           paginationStatus: ResponseStatus.init)));

      //   GetIt.I<HomeBloc>().add(GetRepliesEvent(
      //       params: GetRepliesParams(
      //           getRepliesStatus: ResponseStatus.loading,
      //           pageNumber: 1,
      //           paginationStatus: ResponseStatus.init)));

      //   GetIt.I<HomeBloc>().add(GetAlertsEvent(
      //       params: GetAlertsParams(
      //           getAlertsStatus: ResponseStatus.loading,
      //           pageNumber: 1,
      //           paginationStatus: ResponseStatus.init)));
      // } else {
      //   GetIt.I<HomeBloc>().add(GetMainInfoScreenEvent());

      //   GetIt.I<HomeBloc>().add(GetAlertsEvent(
      //       params: GetAlertsParams(
      //           getAlertsStatus: ResponseStatus.loading,
      //           pageNumber: 1,
      //           paginationStatus: ResponseStatus.init)));
      // }

      // return AppCommonHelpers.getRouteForTheMainScreenWithNavBar(
      //     userType: GetIt.I<PrefsRepository>().getUserType!);
      // }()
      ,
      routes: [
        // auth,
        // home,
      ]);
}

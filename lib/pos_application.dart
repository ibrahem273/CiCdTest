import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/config/theme/app_theme.dart';
import 'package:pos_app/features/app/presentation/blocs/language_bloc.dart';
import 'package:pos_app/features/app/presentation/blocs/theme_bloc.dart';
import 'package:pos_app/routes/router.dart';
import 'package:pos_app/services/localization_services_delegate.dart';
import 'package:pos_app/services/service_provider.dart';

class WizariaatApplication extends StatelessWidget {
  const WizariaatApplication({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return ScreenUtilInit(
      responsiveWidgets: const ['Container'],
      ensureScreenSize: true,
      splitScreenMode: true,
      designSize: const Size( 428, 926),
      builder: (context, child) {
        return ServiceProvider(child: Builder(
          builder: (context) {
            return SafeArea(child: BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, languageState) {
                return BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) => MaterialApp.router(
                    debugShowCheckedModeBanner: false,

                    routerConfig: GRouter.router,
                    theme: state.currentTheme ?? AppTheme.light,
                    locale: const Locale('ar'),
                    localizationsDelegates: [
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      AppLocalization.delegate
                    ],
                    builder: BotToastInit(),
                    supportedLocales: const [Locale('ar'), Locale('en')],
                    // localizationsDelegates: context.localizationDelegates,
                    // builder: (context, child) {LanguageService(context);
                    // // ScreenService(context);
                    // return botToastBuilder(context, child);
                    // },
                  ),
                );
              },
            ));
          },
        ));
      },
    );
    // }
  }
}

//

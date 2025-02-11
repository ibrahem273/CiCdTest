import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_app/core/api/log_interceptor.dart';
import 'package:pos_app/core/data/prefs_repository_impl.dart';
import 'package:pos_app/core/di/di_container.config.dart';
import 'package:pos_app/core/domain/prefs_repository.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt _getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> configureDependencies() async => $initGetIt(_getIt);

@module
abstract class AppModule {
  BaseOptions get dioOption => BaseOptions(
// extra: ,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        contentType: 'application/json',
        responseType: ResponseType.json,
        headers: <String, String>{
          HttpHeaders.acceptHeader: 'application/json',
        },
      );

  @singleton
  Logger get logger => Logger();
  //
  // @preResolve
  // @singleton
  // Future<Database?> get db async
  // {

  //   return await DataBaseService.initialDb();

  // }

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @preResolve
  @singleton
  Future<PrefsRepository> get prefsRepository async {
    SharedPreferences prefs = await sharedPreferences;
    return PrefsRepositoryImpl(prefs);
  }

  @singleton
  Dio dio(BaseOptions options, Logger logger) {
    final dio = Dio(options);
    dio.interceptors.add(LoggerInterceptor());
    return dio;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

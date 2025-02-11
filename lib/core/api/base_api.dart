import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'handling_exception.dart';
import 'methods/detect_server.dart';

abstract class BaseApi<T> with HandlingExceptionRequest {
  BaseApi(this.serverName) {
    Map<String, dynamic> headers = client.options.headers;
    final String? token = getServerToken(serverName);

    if (token != null && token != '') {
      headers = client.options.headers
        ..[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }

    options = Options(headers: headers);
  }

  final ServerName serverName;

  final client = GetIt.I<Dio>();

  late Options options;

  Future<T> call();
}

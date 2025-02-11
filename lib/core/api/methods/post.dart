import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pos_app/core/enums/status_code_type.dart';
import 'package:pos_app/core/error/exception.dart';

import '../api.dart';
import '../client_config.dart';
import 'detect_server.dart';

typedef whenComplete = FutureOr<void> Function();

class PostClient<T> extends BaseApi<T> {
  final void Function(bool isUploadingSuccess)? onUploadingFinished;

  PostClient({
    required this.requestPrams,
    required this.serverName,
    this.onUploadingFinished,
    this.onSendProgress,
    this.onReceiveProgress,
  })  : _fromJson = requestPrams.response.fromJson,
        _valueOnSuccess = requestPrams.response.returnValueOnSuccess,
        _queryParameters = requestPrams.queryParameters,
        _data = requestPrams.data,
        _endpoint = requestPrams.endpoint,
        _receiveTimeout = requestPrams.receiveTimeout,
        _sendTimeout = requestPrams.sendTimeout,
        super(serverName);
  final Stopwatch stopWatch = Stopwatch();
  final RequestConfig<T> requestPrams;

  final ProgressCallback? onSendProgress;
  final ProgressCallback? onReceiveProgress;
  final Duration? _receiveTimeout;
  final Duration? _sendTimeout;
  final FromJson<T>? _fromJson;
  final T? _valueOnSuccess;
  final dynamic _queryParameters;
  final dynamic _data;
  final String _endpoint;
  @override
  final ServerName serverName;

  @override
  Future<T> call() async {
    try {
      final baseUri = getBaseUriForSpecificServer(serverName);
      //todo just in case the server is Cloudinary i want to clear the header
      // if (serverName == ServerName.cloudinary) {
      //   options = Options();
      //   client.options.headers = {};
      //   Fluttertoast.showToast(msg: client.options.headers.toString());
      // }
      // port: 81,
      // port: 81,
      debugPrint(" _sendTimeout$_sendTimeout");

      stopWatch.start();
      final Response response = await client.postUri(
        Uri(
          host: baseUri.host,
          scheme: baseUri.scheme,
          path: _endpoint,
          queryParameters: _queryParameters,
        ),
        options: options.copyWith(
            receiveTimeout: _receiveTimeout ?? options.receiveTimeout,
            sendTimeout: _sendTimeout ?? options.sendTimeout),
        data: _data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      stopWatch.stop();

      if (response.statusCode == StatusCode.operationSucceeded.code) {
        if (response.data['success'] == false) {
          throw ServerException(message: response.data['message']);
        }
        if (_fromJson == null) {
          return Future.value(_valueOnSuccess);
        }

        return _fromJson(response.data);
      } else {
        debugPrint(
            "response.data['error']['message'] ${response.data['error']['message']}");
        throw getException(
            statusCode: response.statusCode!,
            message: response.data['error']['message']);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // Handle error response
        debugPrint("response not null");
        Map<String, dynamic> errorData = e.response!.data;
        String errorMessage = errorData['error']['message'];

        throw (errorMessage);
      } else {
        debugPrint("response isss null");

        throw (ServerException(message: 'no internet connection'));
      }
    } catch (exception) {
      debugPrint("exception Assad $exception");
      rethrow;
    }
  }
}

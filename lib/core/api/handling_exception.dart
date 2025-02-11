import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../error/exception.dart';
import '../error/failures.dart';

typedef RequestCall<T> = Future<T> Function();

mixin class HandlingExceptionRequest {
  void prettyPrinterError(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).e(message);
  }

  void prettyPrinterWtf(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).wtf(message);
  }

  void prettyPrinterI(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).i(message);
  }

  void prettyPrinterV(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).v(message);
  }

  Exception getException({required int statusCode, String? message}) {
    return ServerException(message: message);
  }

  Future<Either<Failure, T>> handlingExceptionRequest<T>(
      {required RequestCall<T> tryCall}) async {
    late T response;
    try {
      response = await tryCall();

      return Right(response);
    } catch (e, stackTrace) {
      if (e is ServerException) {
        return Left(ServerFailure(message: e.message));
      } else {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }
}

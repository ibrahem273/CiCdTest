import 'package:flutter/material.dart';

typedef FromJson<T> = T Function(String body);
typedef VoidFromJson<T> = void Function(dynamic json);


typedef ParamsMap = Map<String, String?>?;

typedef BodyMap = Map<String, dynamic>;

typedef StringFunctionTypeDef = String? Function(String?);

typedef NotNullStringFunctionTypeDef = String? Function(String);


typedef OnTapOutSideTypeDef = void Function(PointerDownEvent)?;

typedef VoidFunctionStringTypeDef = void Function(String)?;

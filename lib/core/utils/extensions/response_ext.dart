import 'package:dio/dio.dart';

extension ResponseExt on Response{

  bool get isSuccessCode => statusCode == 200;
  bool get isBadRequestCode => statusCode == 400;
  bool get isForbiddenCode => statusCode == 403;
  bool get isNotFound => statusCode == 404;
}
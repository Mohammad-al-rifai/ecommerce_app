// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:ecommerce/config/urls.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../presentation/resources/constants_manager.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "Accept";
const String AUTHORIZATION = "Authorization";
const String DEFAULT_LANGUAGE = "language";

class DioHelper {
  static late Dio dio;

  static init() {
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      // ACCEPT: APPLICATION_JSON,
      // AUTHORIZATION: Constants.token,
      // DEFAULT_LANGUAGE: language
    };

    dio = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        receiveDataWhenStatusError: true,
        headers: headers,
        receiveTimeout: Constants.apiTimeOut,
        sendTimeout: Constants.apiTimeOut,
      ),
    );

    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      AUTHORIZATION: token ?? '',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      AUTHORIZATION: token ?? '',
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      AUTHORIZATION: token ?? '',
    };
    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}

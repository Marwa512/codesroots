import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fly_networking/AppException.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: "https://imake-app.com:4001/api",
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
          }),
    );
  }

  static final Map<String, String> _headerMap = {
    'Content-Type': 'application/json',
  };

  static void addToken(String token) {
    if (_headerMap.containsKey(HttpHeaders.authorizationHeader)) {
      _headerMap.remove(HttpHeaders.authorizationHeader);
    }
    _headerMap.putIfAbsent(
        HttpHeaders.authorizationHeader, () => 'Bearer $token');
  }

  static Future<Map<String, dynamic>> getData({
    required String url,
    dynamic query,
  }) async {
    if (kDebugMode) {
      print("API ${dio.options.baseUrl + url}, Query : $query");
    }
    final Response<dynamic> response =
        await dio.get(url, options: Options(headers: _headerMap));
    if (kDebugMode) {
      print("response$response");
    }
    final Map<String, dynamic> responseMap = response.data;
    if (responseMap["error"]) {
      throw AppException(true,
          beautifulMsg: responseMap['message'],
          code: response.statusCode ?? 0,
          title: '');
    }
    return responseMap;
  }

  static Future<Map<String, dynamic>> postData({
    required String url,
    dynamic query,
    required dynamic data,
  }) async {
    if (kDebugMode) {
      print("API ${dio.options.baseUrl + url}, Query : $query , Data: $data");
    }

    final Response<dynamic> response = await dio.post(url,
        queryParameters: query,
        data: data,
        options: Options(headers: _headerMap));
    if (kDebugMode) {
      print("response$response");
    }
    final Map<String, dynamic> responseMap = response.data;
    // if (responseMap["error"]) {
    //   throw AppException(true,
    //       beautifulMsg: responseMap['message'],
    //       code: response.statusCode ?? 0,
    //       title: '');
    // }
    return responseMap;
  }

}

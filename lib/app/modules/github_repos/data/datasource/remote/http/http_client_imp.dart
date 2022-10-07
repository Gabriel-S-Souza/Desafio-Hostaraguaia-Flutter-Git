import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../models/models.dart';

class HttpClientImp implements HttpClient {
  final Dio _dio;

  HttpClientImp({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: Constants.baseUrl,
                connectTimeout: 10000,
                receiveTimeout: 10000,
                headers: {'Content-Type': 'application/json'},
              ),
            ) {
    _initialize();
  }

  void _initialize() {
    _dio.interceptors.add(_buildInterceptor);
  }

  @override
  Future<ResponseModel> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return ResponseModel(
        statusCode: response.statusCode ?? 0,
        body: response.data,
      );
    } catch (e) {
      rethrow;
    }
  }

  LogInterceptor get _buildInterceptor => LogInterceptor(
      request: false,
      error: false,
      requestBody: false,
      requestHeader: false,
      responseHeader: false,
      responseBody: false,
      logPrint: (object) {
        log(object.toString(), name: 'dio', level: 0);
      });
}

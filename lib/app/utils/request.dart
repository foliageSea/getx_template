import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import 'log.dart';

/// 网络请求单例类
class Request {
  Dio? _dio;

  Dio get dio => _dio!;

  static final Request _singleton = Request._internal();

  factory Request() => _singleton;

  Request._internal() {
    // 创建 Dio 实例
    if (_dio != null) return;

    BaseOptions baseOptions = BaseOptions(
      // 连接超时
      connectTimeout: const Duration(seconds: 5),
      // 响应超时
      receiveTimeout: const Duration(seconds: 10),
    );

    _dio = Dio(baseOptions);

    _dio!.interceptors.add(
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
      ),
    );
  }

  void updateBaseUrl(String baseUrl) {
    _dio!.options.baseUrl = baseUrl;
  }

  void updateToken(String token) {
    _dio!.options.headers["Authorization"] = "Bearer $token";
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio!.request(
      path,
      queryParameters: queryParameters,
      options: Options(
        method: "GET",
      ),
    );
  }

  Future<Response> post(
    String path, {
    Object? data,
  }) {
    return _dio!.request(
      path,
      data: data,
      options: Options(
        method: "POST",
      ),
    );
  }

  Future<Response> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) {
    return _dio!.request(
      path,
      queryParameters: queryParameters,
      data: data,
      options: Options(
        method: "PUT",
      ),
    );
  }
}

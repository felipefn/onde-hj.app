import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../shared/enums/host.dart';
import 'environment.dart';
import 'main_client_interface.dart';


class DioClient implements IMainClient {
  late Dio _dio;

  @override
  late Environment environment;

  @override
  late String environmentName;

  @override
  // IClientInterceptor? interceptor;

  Map<String, dynamic> defaultHeaders = {};

  // final IErrorReport? errorReport;

  DioClient({
    Dio? dioClient,
    // List<LogType> typesToLog = const [],
    required Environment initialEnvironment,
    // IClientInterceptor? interceptor,
    String? userAgent,
    String? appVersion,
    // this.errorReport,
    bool showCurl = false,
  }) {
    _dio = dioClient ?? Dio();
    // final dioInterceptor = DioClientInterceptor(interceptor);

    // LogManager.shared.typesToLog = typesToLog;
    // _dio.interceptors.add(dioInterceptor);
    if (showCurl) {
      // _dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    }

    _dio.options.headers['accept-language'] = 'pt-BR';
    _dio.options.headers['user-agent'] = userAgent;
    _dio.options.headers['app-version'] = appVersion;
    _dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 60),
    );

    setEnvironment(initialEnvironment);
  }

  @override
  Future setToken(String token) async {
    defaultHeaders['Authorization'] = 'Bearer $token';
  }

  @override
  Future setUserAgent(String userAgent, [String? appVersion]) async {
    _dio.options.headers['user-agent'] = userAgent;
    if (appVersion == null) return;
    _dio.options.headers['app-version'] = appVersion;
  }

  @override
  Future setEnvironment(Environment environment) async {
    this.environment = environment;
    environmentName = environment.name;
    defaultHeaders['X-API-KEY'] = environment.apiKey;
  }

  @override
  Future get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Host host = Host.api,
    dynamic cancelToken,
    bool addApiKey = true,
  }) async {
    var stack = StackTrace.current;
    final requestUrl = getUrl(url, host);
    final params = getParameters(queryParameters, host, addApiKey: addApiKey);
    final requestHeaders = getHeaders(headers, host);

    final Response response = await _dio
        .get(
          requestUrl,
          queryParameters: params,
          options: Options(headers: requestHeaders),
          cancelToken: cancelToken as CancelToken?,
        )
        .catchError((error) => _onError(error, stack));

    return _parseSuccess(response);
  }

  @override
  Future post(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Host host = Host.api,
    dynamic cancelToken,
    bool addApiKey = true,
  }) async {
    var stack = StackTrace.current;
    final requestUrl = getUrl(url, host);
    final params = getParameters(queryParameters, host, addApiKey: addApiKey);
    final requestHeaders = getHeaders(headers, host);

    final hasBody = body != null && body.isNotEmpty;

    final Response response = await _dio
        .post(
          requestUrl,
          queryParameters: params,
          options: Options(headers: requestHeaders),
          data: hasBody ? jsonEncode(body) : null,
          cancelToken: cancelToken as CancelToken?,
        )
        .catchError((error) => _onError(error, stack));

    return _parseSuccess(response);
  }

  @override
  Future patch(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Host host = Host.api,
    dynamic cancelToken,
    bool addApiKey = true,
  }) async {
    var stack = StackTrace.current;
    final requestUrl = getUrl(url, host);
    final params = getParameters(queryParameters, host, addApiKey: addApiKey);
    final requestHeaders = getHeaders(headers, host);

    final Response response = await _dio
        .patch(
          requestUrl,
          queryParameters: params,
          options: Options(headers: requestHeaders),
          data: jsonEncode(body),
          cancelToken: cancelToken as CancelToken?,
        )
        .catchError((error) => _onError(error, stack));

    return _parseSuccess(response);
  }

  @override
  Future put(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Host host = Host.api,
    dynamic cancelToken,
    bool addApiKey = true,
  }) async {
    var stack = StackTrace.current;
    final requestUrl = getUrl(url, host);
    final params = getParameters(queryParameters, host, addApiKey: addApiKey);
    final requestHeaders = getHeaders(headers, host);

    final Response response = await _dio
        .put(
          requestUrl,
          queryParameters: params,
          options: Options(headers: requestHeaders),
          data: jsonEncode(body),
          cancelToken: cancelToken as CancelToken?,
        )
        .catchError((error) => _onError(error, stack));

    return _parseSuccess(response);
  }

  @override
  Future delete(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Host host = Host.api,
    dynamic cancelToken,
    bool addApiKey = true,
  }) async {
    var stack = StackTrace.current;
    final requestUrl = getUrl(url, host);
    final params = getParameters(queryParameters, host, addApiKey: addApiKey);
    final requestHeaders = getHeaders(headers, host);

    final Response response = await _dio
        .delete(
          requestUrl,
          queryParameters: params,
          options: Options(headers: requestHeaders),
          data: jsonEncode(body),
          cancelToken: cancelToken as CancelToken?,
        )
        .catchError((error) => _onError(error, stack));

    return _parseSuccess(response);
  }

  String getUrl(
    String url,
    Host host,
  ) {
    String hostUrl = host.url;
    final prefix = host == Host.api
        ? environment.apiPrefix
        : environment.prefix ?? environment.apiPrefix;

    if (host == Host.eventSearch && environment.type != EnvironmentType.prod) {
      hostUrl = Host.eventSearchHml.url;
    }

    if (host == Host.devices && environment.type != EnvironmentType.prod) {
      return 'https://${Host.devicesHml.url}/$url';
    }

    String requestUrl = 'https://$prefix$hostUrl/$url';
    if (host == Host.undefined) {
      requestUrl = url;
    }

    return requestUrl;
  }

  Map<String, dynamic>? getHeaders(
    Map<String, dynamic>? headers,
    Host host,
  ) {
    return host != Host.undefined
        ? {...defaultHeaders, ...(headers ?? {})}
        : headers;
  }

  Map<String, dynamic>? getParameters(
    Map<String, dynamic>? params,
    Host host, {
    bool addApiKey = true,
  }) {
    return host != Host.undefined && host != Host.eventSearch && addApiKey
        ? {'apikey': environment.apiKey, ...(params ?? {})}
        : params;
  }

  _onError(
    DioException error,
    StackTrace stackTrace,
  ) {
    // final event = RequestLogEventExtension.fromDioError(error, stackTrace);
    // final exception = error.toException(stackTrace);
    // final newTrace = _adjustStackTrace(stackTrace);

    // LogManager.shared.logRequestEvent(event);
    // errorReport?.recordException(
    //   exception: exception,
    //   stack: newTrace,
    //   reason: exception.message,
    //   errorCode: exception.statusCode,
    //   printDebugLog: LogManager.shared.typesToLog.contains(LogType.error),
    // );

    // throw exception;
  }

  StackTrace _adjustStackTrace(StackTrace stack) {
    final regex = RegExp(r'^#\d{1,3}');
    List<String> splitted =
        stack.toString().replaceAll('"', '').split('\n').reversed.toList();
    List<String> newList = [];
    splitted.removeWhere((value) => value.contains('Store.executeEither'));
    splitted
        .removeWhere((value) => value.contains('<asynchronous suspension>'));

    int counter = 0;
    for (var i = 0; i < splitted.length; i++) {
      final newValue =
          splitted[i].replaceAll(regex, '').replaceAll('      ', '');
      newList.add('#$counter      $newValue');
      counter++;
    }

    newList.removeWhere((element) => element.isEmpty);
    return StackTrace.fromString(newList.join('\n'));
  }

  dynamic _parseSuccess(Response response) {
    int statusCode = response.statusCode ?? 0;
    if (199 < statusCode && statusCode < 300) return response.data;

    // throw IngresseRequestException(statusCode, 'Unknown Error', null, null);
  }
}

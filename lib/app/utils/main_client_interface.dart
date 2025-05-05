
import 'environment.dart';

abstract class IMainClient {
  late Environment environment;

  late String environmentName;

  // IClientInterceptor? interceptor;

  setToken(String token);

  setUserAgent(String userAgent, [String? appVersion]);

  setEnvironment(Environment environment);

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    // Host host,
    dynamic cancelToken,
    bool addApiKey = true,
  });

  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    // Host host,
    dynamic cancelToken,
    bool addApiKey = true,
  });

  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    // Host host,
    dynamic cancelToken,
    bool addApiKey = true,
  });

  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    // Host host,
    dynamic cancelToken,
    bool addApiKey = true,
  });

  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    // Host host,
    dynamic cancelToken,
    bool addApiKey = true,
  });
}

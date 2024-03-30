import 'package:carguru/repository/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:carguru/constant/app_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dio_provider.g.dart';

@riverpod
Future<Dio> dio(DioRef ref) async {
  Dio dio = Dio();
  AppConfig appConfi = AppConfig();
  final authRepo = await ref.read(authRepositoryProvider.future);
  var headers = {
    'Authorization': 'Bearer ${authRepo.userData?.token}',
  };
  dio
    ..options.baseUrl = appConfi.apiBaseUrl
    ..options.connectTimeout = appConfi.apiConnectTimeout
    ..options.receiveTimeout = appConfi.apiReceiveTimeout
    ..options.headers = headers
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          return handler.next(error);
        },
      ),
    );

  // dio.httpClientAdapter = IOHttpClientAdapter(
  //   createHttpClient: () {
  //     final HttpClient client =
  //         HttpClient(context: SecurityContext(withTrustedRoots: false));
  //     client.badCertificateCallback = (cert, host, port) => true;
  //     return client;
  //   },
  //   validateCertificate: (cert, host, port) {
  //     if (cert == null) {
  //       return false;
  //     }
  //     return true;
  //   },
  // );
  return dio;
}

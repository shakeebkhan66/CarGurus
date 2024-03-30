import 'package:carguru/constant/constant.dart';

class AppConfig {
  static const AppEnvironment _appEnvironment = AppEnvironment.dev;

  AppEnvironment get appEnvironment => _appEnvironment;
  String get appEnvironmentName => _appEnvironment.name;

  static const String _devUrl = "https://workshop.ztoo.cloud/api/";
  static const String _demoUrl = "https://workshop.ztoo.cloud/api/";
  static const String _productionUrl = "https://workshop.ztoo.cloud/api/";

  final String apiBaseUrl = (_appEnvironment == AppEnvironment.dev)
      ? _devUrl
      : (_appEnvironment == AppEnvironment.demo)
          ? _demoUrl
          : (_appEnvironment == AppEnvironment.production)
              ? _productionUrl
              : "";

  Duration apiConnectTimeout = const Duration(seconds: 60);
  Duration apiReceiveTimeout = const Duration(seconds: 60);
}

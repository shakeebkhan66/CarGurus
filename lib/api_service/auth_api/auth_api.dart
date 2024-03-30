import 'package:carguru/model/api_response_model/api_response_model.dart';
import 'package:carguru/model/user_model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:carguru/core/core.dart';
import 'package:carguru/model/auth/signup_model.dart';
import 'package:carguru/network/dio_provider.dart';
import 'package:carguru/network/network_exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_api.g.dart';

class AuthApi {
  AuthApi({required this.dio});

  final Dio dio;

  Future<ApiSuccessResponseModel> signUp(SignUpData signUpData) async {
    try {
      final response = await dio.post(
        "register",
        data: FormData.fromMap(signUpData.toJson()),
      );

      final resData = response.data;

      if (response.data == null) {
        return Future.error(AppException(errorMessage: "No record found"));
      }

      if ((resData is Map) == false) {
        return Future.error(
          AppException(errorMessage: "invalid response type"),
        );
      }
      return ApiSuccessResponseModel.fromJson(resData);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400 &&
          e.response?.data != null &&
          (e.response?.data is Map)) {
        var errorData =
            ApiValidationErrorResponseModel.fromJson(e.response?.data);
        var errorMessage = errorData.message?.values
            .join("\n")
            .replaceAll("[", "")
            .replaceAll("]", "");
        return Future.error(
          AppException(
            errorMessage: errorMessage ?? "Something went wrong",
          ),
        );
      }
      final errorMessage = NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e));

      return Future.error(AppException(errorMessage: errorMessage));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UserDataModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "login",
        data: {"email": email, "password": password},
      );

      final resData = response.data;

      if (response.data == null) {
        return Future.error(AppException(errorMessage: "No record found"));
      }

      if ((resData is Map) == false) {
        return Future.error(
          AppException(errorMessage: "invalid response type"),
        );
      }

      var userData = resData["user"];
      String token = resData["token"];
      if (userData is Map<String, dynamic> && token.isNotEmptyOrNull) {
        userData.addAll({"token": token});
        return UserDataModel.fromJson(userData);
      } else {
        return Future.error(
          AppException(errorMessage: "invalid response type"),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400 &&
          e.response?.data != null &&
          (e.response?.data is Map)) {
        var errorData =
            ApiValidationErrorResponseModel.fromJson(e.response?.data);
        var errorMessage = errorData.message?.values
            .join("\n")
            .replaceAll("[", "")
            .replaceAll("]", "");
        return Future.error(
          AppException(
            errorMessage: errorMessage ?? "Something went wrong",
          ),
        );
      }
      final errorMessage = NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e));

      return Future.error(AppException(errorMessage: errorMessage));
    } catch (e) {
      return Future.error(e);
    }
  }
}

@riverpod
Future<AuthApi> authApi(AuthApiRef ref) async {
  final dioProv = await ref.read(dioProvider.future);
  return AuthApi(dio: dioProv);
}

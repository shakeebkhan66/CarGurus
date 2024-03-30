import 'package:carguru/api_service/auth_api/auth_api.dart';
import 'package:carguru/core/core.dart';
import 'package:carguru/repository/auth_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Future<bool> build() async {
    final authRepo = await ref.read(authRepositoryProvider.future);
    final isLoggedIn = await authRepo.checkLoginUser();
    await Future.delayed(const Duration(seconds: 2));
    return isLoggedIn;
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final authApi = await ref.read(authApiProvider.future);
      final loginRes = await authApi.signIn(email: email, password: password);
      if (loginRes.token.isNotEmptyOrNull) {
        final authRepo = await ref.read(authRepositoryProvider.future);
        final isLoggedIn = await authRepo.setLoginUser(userdata: loginRes);
        if (isLoggedIn) {
          state = const AsyncValue.data(true);
        }
      } else {
        throw AppException(
          errorMessage: "Login Failed, please try again",
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final authRepo = await ref.read(authRepositoryProvider.future);
      final isLoggedOut = await authRepo.removeLoggedInUser();
      if (isLoggedOut) {
        state = const AsyncValue.data(false);
      } else {
        throw AppException(errorMessage: "Having trouble logging out");
      }
    } catch (e) {
      rethrow;
    }
  }
}

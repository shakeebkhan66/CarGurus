import 'dart:convert';

import 'package:carguru/model/user_model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:carguru/services/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repo.g.dart';

class AuthRepository {
  AuthRepository() {
    checkLoginUser();
  }
  UserDataModel? userData;
  late AsyncCallback onLogout;

  SecureStorage secureStorage = SecureStorage();

  Future<bool> checkLoginUser() async {
    try {
      final loggedInUser = await getLoggedInUser();
      if (loggedInUser != null) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> setLoginUser({required UserDataModel userdata}) async {
    try {
      secureStorage.write(
        key: "loggedInUser",
        value: jsonEncode(userdata.toJson()),
      );
      return await checkLoginUser();
    } catch (e) {
      rethrow;
    }
  }

  Future<UserDataModel?> getLoggedInUser() async {
    try {
      final loggedInUser = await secureStorage.read(key: "loggedInUser");
      if (loggedInUser != null) {
        final jsonData = jsonDecode(loggedInUser);
        if (jsonData is Map<String, dynamic>) {
          final loggedInUserData = UserDataModel.fromJson(jsonData);
          userData = loggedInUserData;
          return loggedInUserData;
        }
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> removeLoggedInUser() async {
    try {
      await secureStorage.delete(key: "loggedInUser");
      final isLoggedIn = await checkLoginUser();
      if (isLoggedIn) {
        return false;
      } else {
        onLogout();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
Future<AuthRepository> authRepository(AuthRepositoryRef ref) async {
  return AuthRepository();
}

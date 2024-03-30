import 'package:carguru/screen/bottombar/bottombar_screen.dart';
import 'package:carguru/screen/login_flow/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carguru/provider/auth_provider/auth_provider.dart';
import 'package:carguru/repository/auth_repo.dart';
import 'package:carguru/screen/components/loading_screen_widget.dart';

class AppManagerScreen extends ConsumerStatefulWidget {
  const AppManagerScreen({super.key});

  @override
  ConsumerState<AppManagerScreen> createState() => _AppManagerScreenState();
}

class _AppManagerScreenState extends ConsumerState<AppManagerScreen> {
  @override
  Widget build(BuildContext context) {
    final authProv = ref.watch(authProvider);
    return authProv.when(
      data: (isLoggedIn) {
        if (isLoggedIn) {
          final authRepoProv = ref.watch(authRepositoryProvider);
          return authRepoProv.when(
            data: (authRepo) {
              handleOnLogout(authRepo);
              return const BottomBarScreen();
            },
            error: (error, stackTrace) {
              return const Scaffold(
                body: Center(
                  child: Text("Something went wrong"),
                ),
              );
            },
            loading: () {
              return const LoadingScreenWidget(isPrimary: true);
            },
          );
        } else {
          return const LoginScreen();
        }
      },
      error: (error, stackTrace) {
        return const Scaffold(
          body: Center(
            child: Text("Something went wrong"),
          ),
        );
      },
      loading: () {
        return const LoadingScreenWidget(isPrimary: true);
      },
    );
  }

  void handleOnLogout(AuthRepository authRepo) {
    debugPrint("## handle on logout");
    debugPrint("## userdata ${authRepo.userData}");
    authRepo.onLogout = () async {
      debugPrint("## called handle on logout");
      Navigator.of(context).popUntil((route) => route.isFirst);
    };
  }
}

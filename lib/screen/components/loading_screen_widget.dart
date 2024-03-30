import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreenWidget extends StatelessWidget {
  const LoadingScreenWidget({
    super.key,
    this.color = Colors.green,
    this.isPrimary = false,
  });

  final Color color;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      return Scaffold(
        body: SpinKitThreeBounce(
          size: 30,
          color: color,
        ),
      );
    } else {
      return Scaffold(
        body: SpinKitCircle(
          size: 50,
          color: color,
        ),
      );
    }
  }
}

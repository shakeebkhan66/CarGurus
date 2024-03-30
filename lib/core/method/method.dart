import 'package:flutter/material.dart';

bool? isFirstScreen(BuildContext context) {
  return ModalRoute.of(context)?.isFirst;
}

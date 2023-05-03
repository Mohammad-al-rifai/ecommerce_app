import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../resources/assets_manager.dart';

class DefaultError extends StatelessWidget {
  const DefaultError({
    Key? key,
    this.xT = 0.0,
    this.yT = 0.0,
  }) : super(key: key);

  final double xT;
  final double yT;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(xT, yT),
      child: Lottie.asset(
        JsonAssets.error,
        fit: BoxFit.fitWidth,
        width: 100.0,
      ),
    );
  }
}

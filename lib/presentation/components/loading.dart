import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../resources/assets_manager.dart';

class DefaultLoading extends StatelessWidget {
  const DefaultLoading({
    Key? key,
    this.xT = 0.0,
    this.yT = 0.0,
    this.size,
  }) : super(key: key);

  final double xT;
  final double yT;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Transform.translate(
          offset: Offset(xT, yT),
          child: Lottie.asset(JsonAssets.loading,
              fit: BoxFit.fitWidth, width: size ?? 50.0, height: size ?? 50.0),
        ),
      ),
    );
  }
}

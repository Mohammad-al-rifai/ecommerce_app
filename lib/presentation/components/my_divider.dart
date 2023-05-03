// ignore_for_file: must_be_immutable

import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  MyDivider({
    Key? key,
    this.width,
    this.margin,
    this.alignment,
    this.color,
  }) : super(key: key);

  double? width;
  double? margin;
  Color? color;
  AlignmentDirectional? alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? AlignmentDirectional.center,
      child: Container(
        margin: EdgeInsetsDirectional.all(margin ?? 0.0),
        height: 1.0,
        width: width ?? getScreenWidth(context),
        color: color ?? ColorManager.primary,
      ),
    );
  }
}

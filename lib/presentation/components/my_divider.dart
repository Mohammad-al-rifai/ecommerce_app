// ignore_for_file: must_be_immutable

import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  MyDivider({
    Key? key,
    this.width,
  }) : super(key: key);

  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      width: width ?? getScreenWidth(context),
      color: ColorManager.primary,
    );
  }
}

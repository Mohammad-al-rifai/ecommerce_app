// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class MText extends StatelessWidget {
  MText({Key? key, required this.text, this.style}) : super(key: key);

  String text;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr(),
      style: style ?? getMediumStyle(color: ColorManager.primary),
    );
  }
}

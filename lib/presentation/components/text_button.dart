// ignore_for_file: must_be_immutable

import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class DTextButton extends StatelessWidget {
  DTextButton({
    Key? key,
    required this.text,
    required this.function,
    this.isUpperCase = false,
  }) : super(key: key);

  Function function;
  bool isUpperCase;
  String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => function(),
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: getMediumStyle(color: ColorManager.primary),
      ),
    );
  }
}

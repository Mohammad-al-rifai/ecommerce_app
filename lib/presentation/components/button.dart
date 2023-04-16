// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'loading.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    super.key,
    required this.function,
    required this.text,
    this.width = double.infinity,
    this.background = ColorManager.primary,
    this.isUpperCase = true,
    this.radius = AppSize.s8,
    this.isLoading = false,
  });

  Function function;
  String text;
  double? width;
  Color? background;
  bool? isUpperCase;
  double? radius;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: Conditional.single(
        context: context,
        conditionBuilder: (BuildContext context) => !isLoading,
        widgetBuilder: (BuildContext context) {
          return MaterialButton(
            onPressed: () => function(),
            child: Text(
              isUpperCase! ? text.toUpperCase() : text,
              style: getRegularStyle(
                color: ColorManager.white,
                fontSize: AppPadding.p18,
              ),
            ),
          );
        },
        fallbackBuilder: (BuildContext context) {
          return DefaultLoading(
            xT: 0.0,
            yT: -40.0,
          );
        },
      ),
    );
  }
}

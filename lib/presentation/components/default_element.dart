import 'package:flutter/material.dart';

import '../../app/functions.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'my_text.dart';

class DefaultLabel extends StatelessWidget {
  const DefaultLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          textBaseline: TextBaseline.ideographic,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 50.0,
              height: 18.0,
              margin: const EdgeInsetsDirectional.only(start: AppMargin.m8),
              decoration: getDeco(withShadow: true),
            ),
            const SizedBox(
              width: AppSize.s8,
            ),
            Transform.translate(
              offset: const Offset(0.0, 2),
              child: MText(
                text: text,
                style: getBoldStyle(color: ColorManager.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

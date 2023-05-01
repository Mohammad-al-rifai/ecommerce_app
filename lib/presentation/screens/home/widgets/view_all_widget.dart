import 'package:ecommerce/app/functions.dart';
import 'package:flutter/material.dart';

import '../../../components/my_text.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/values_manager.dart';

class ViewAllWidget extends StatelessWidget {
  const ViewAllWidget({Key? key, required this.onTap}) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        end: AppPadding.p8,
        start: AppPadding.p4,
      ),
      child: FloatingActionButton(
        heroTag: getRandomString(4),
        onPressed: () => onTap(),
        child: MText(
          text: AppStrings.showAll,
          color: ColorManager.white,
          maxLines: 2,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../app/functions.dart';
import '../../../domain/models/categories/all_categories_model.dart';
import '../../components/default_image.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({Key? key, required this.catData}) : super(key: key);
  final CategoryData catData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.lightPrimary.withOpacity(.4),
          borderRadius: BorderRadiusDirectional.circular(AppSize.s8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: AppSize.s25,
            child: DefaultImage(imageUrl: catData.imageOfCate),
          ),
          const SizedBox(
            height: AppSize.s8,
          ),
          Text(
            getNameTr(
              arName: catData.arName,
              enName: catData.enName,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: getBoldStyle(color: ColorManager.darkPrimary),
          )
        ],
      ),
    );
  }
}

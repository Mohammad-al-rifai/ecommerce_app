import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../app/functions.dart';
import '../resources/values_manager.dart';

class FullScreenPicture extends StatefulWidget {
  const FullScreenPicture({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  State<FullScreenPicture> createState() => _FullScreenPictureState();
}

class _FullScreenPictureState extends State<FullScreenPicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Hero(
              tag: widget.imageUrl,
              child: PhotoView(
                imageProvider: CachedNetworkImageProvider(
                  widget.imageUrl,
                ),
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: const EdgeInsetsDirectional.all(AppMargin.m8),
                height: 40.0,
                width: 40.0,
                decoration: getDeco(withShadow: true, borderSize: AppSize.s8),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: ColorManager.white,
                    size: AppSize.s25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

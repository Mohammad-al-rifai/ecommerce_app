import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/presentation/components/full_screen_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/urls.dart';
import 'error.dart';
import 'loading.dart';

class DefaultImage extends StatelessWidget {
  const DefaultImage({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.clickable = false,
  }) : super(key: key);

  final String? imageUrl;
  final BoxFit? fit;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    if (clickable) {
      return GestureDetector(
        onTap: () {
          navigateTo(
            context,
            FullScreenPicture(
              imageUrl: Urls.filesUrl + (imageUrl ?? ''),
            ),
          );
        },
        child: image(),
      );
    } else {
      return image();
    }
  }

  Widget image() => CachedNetworkImage(
        imageUrl: Urls.filesUrl + (imageUrl ?? ''),
        fit: fit,
        width: double.infinity,
        placeholder: (context, url) => const Center(
          child: SizedBox(
            child: CupertinoActivityIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => const Center(
          child: SizedBox(
            child: DefaultError(),
          ),
        ),
      );
}

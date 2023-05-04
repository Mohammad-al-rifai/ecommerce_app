import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/app/languages.dart';
import 'package:ecommerce/presentation/components/my_text.dart';
import 'package:ecommerce/presentation/layouts/merchant_layout/merchant_layout_cubit/merchant_layout_cubit.dart';
import 'package:ecommerce/presentation/resources/styles_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/merchant/products/product_details_widgets/gallery_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/urls.dart';
import '../../../../domain/models/product_models/merchant_products_model.dart';
import '../../../components/my_page_view.dart';
import '../../../resources/color_manager.dart';
import '../../../components/full_screen_picture.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final MerchantProduct? product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GalleryWidget(product: widget.product),
              const SizedBox(
                height: AppSize.s4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

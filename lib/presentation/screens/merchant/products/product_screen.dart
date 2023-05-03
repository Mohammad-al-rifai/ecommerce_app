import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/presentation/components/my_divider.dart';
import 'package:ecommerce/presentation/components/my_text.dart';
import 'package:ecommerce/presentation/layouts/merchant_layout/merchant_layout_cubit/merchant_layout_cubit.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/merchant/products/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
    required this.merchantId,
  }) : super(key: key);

  final String merchantId;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MerchantLayoutCubit()
        ..getMerchantProducts(merchantId: widget.merchantId),
      child: BlocConsumer<MerchantLayoutCubit, MerchantLayoutStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          MerchantLayoutCubit cubit = MerchantLayoutCubit();

          if (state is GetMerchantProDoneState) {
            return Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: AppPadding.p8,
              ),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProductWidget(
                    product: state.products?[index],
                  );
                },
                itemCount: state.products?.length ?? 1,
                separatorBuilder: (BuildContext context, int index) {
                  return MyDivider(
                    margin: 4,
                    color: ColorManager.white,
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

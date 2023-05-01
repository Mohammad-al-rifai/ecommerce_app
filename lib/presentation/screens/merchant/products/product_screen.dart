import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/presentation/components/my_text.dart';
import 'package:ecommerce/presentation/components/templete_list.dart';
import 'package:ecommerce/presentation/layouts/merchant_layout/merchant_layout_cubit/merchant_layout_cubit.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
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
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsetsDirectional.all(AppMargin.m8),
                  padding: const EdgeInsetsDirectional.all(AppMargin.m8),
                  decoration: getDeco(withShadow: true),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MText(
                          text: state.products?[index].name ?? 'No Name',
                          color: ColorManager.white),
                      MText(
                          text: state.products?[index].mainCategorie ??
                              'No mainCategory',
                          color: ColorManager.white),
                    ],
                  ),
                );
              },
              itemCount: state.products?.length,
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

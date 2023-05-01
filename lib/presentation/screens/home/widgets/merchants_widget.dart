import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/domain/models/auth_models/merchants_model.dart';
import 'package:ecommerce/presentation/layouts/home_layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:ecommerce/presentation/screens/home/widgets/view_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/urls.dart';
import '../../../components/my_text.dart';
import '../../../layouts/merchant_layout/merchant_layout.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class AllMerchantsWidget extends StatefulWidget {
  const AllMerchantsWidget({Key? key}) : super(key: key);

  @override
  State<AllMerchantsWidget> createState() => _AllMerchantsWidgetState();
}

class _AllMerchantsWidgetState extends State<AllMerchantsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit()..getMerchant(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          HomeLayoutCubit cubit = HomeLayoutCubit.get(context);
          if (state is GetMerchantsDoneState) {
            return SizedBox(
              height: AppSize.s60,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemExtent: AppSize.s60,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return buildMerchantItem(user: state.merchants?[index]);
                      },
                      itemCount: state.merchants?.length,
                    ),
                  ),
                  ViewAllWidget(onTap: () {}),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget buildMerchantItem({MerchantUser? user}) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 4.0,
      ),
      child: GestureDetector(
        onTap: () {
          navigateTo(
            context,
            MerchantLayout(
              merchantUser: user,
            ),
          );
        },
        child: CircleAvatar(
          backgroundColor: ColorManager.primary,
          backgroundImage: CachedNetworkImageProvider(
            Urls.filesUrl + (user?.marketLogo ?? ''),
          ),
          child: MText(
            text: user?.marketName ?? 'no Name',
            color: ColorManager.darkPrimary,
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/presentation/components/text_form_field.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_layout_cubit/home_layout_cubit.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);
        return Scaffold(
          appBar: getAppBar(),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottom(
                index,
                function: (index) {
                  if (index == 0) {
                    cubit.getBanners();
                  }
                },
              );
            },
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home), label: 'home'.tr()),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.apps), label: 'categories'.tr()),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_bag_rounded),
                  label: 'cart'.tr()),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.person), label: 'profile'.tr()),
            ],
          ),
        );
      },
    );
  }

  TextEditingController searchController = TextEditingController();

  PreferredSizeWidget getAppBar() {
    return AppBar(
      title: TFF(
        controller: searchController,
        label: 'search'.tr(),
        prefixIcon: Icons.search,
        validator: (String value) {},
      ),
    );
  }
}

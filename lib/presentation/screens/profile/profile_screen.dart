import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/app/languages.dart';
import 'package:ecommerce/data/network/local/cache_helper.dart';
import 'package:ecommerce/data/network/local/keys.dart';
import 'package:ecommerce/presentation/components/button.dart';
import 'package:ecommerce/presentation/components/loading.dart';
import 'package:ecommerce/presentation/components/my_divider.dart';
import 'package:ecommerce/presentation/components/my_text.dart';
import 'package:ecommerce/presentation/components/text_button.dart';
import 'package:ecommerce/presentation/components/toast_notifications.dart';
import 'package:ecommerce/presentation/layouts/home_layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:ecommerce/presentation/resources/assets_manager.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/constants_manager.dart';
import 'package:ecommerce/presentation/resources/string_manager.dart';
import 'package:ecommerce/presentation/resources/styles_manager.dart';
import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:lottie/lottie.dart';

import '../../../domain/models/auth_models/user_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    if (Constants.token.isNotEmpty) {
      HomeLayoutCubit.get(context).getProfile();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeLayoutCubit cubit = HomeLayoutCubit.get(context);
        return Padding(
          padding: const EdgeInsetsDirectional.all(AppPadding.p8),
          child: Column(
            children: [
              getUserWidget(),
              MyDivider(margin: 8.0),
              languageSettings(),
              MyDivider(
                margin: 8.0,
                width: getScreenWidth(context) / 3,
                alignment: AlignmentDirectional.centerStart,
                color: ColorManager.lightPrimary,
              ),
            ],
          ),
        );
      },
    );
  }

  Decoration getDeco({Color? color}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: color,
    );
  }

  Widget getUserWidget() {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {
        if (state is LogoutDoneState) {
          showToast(text: state.message, state: ToastStates.SUCCESS);

          // Remove Token;
          CacheHelper.removeData(key: CacheHelperKeys.token).then((value) {
            Constants.token = "";
          });

          // Remove Full Name;
          CacheHelper.removeData(key: CacheHelperKeys.fullName).then((value) {
            Constants.fullName = "";
          });

          // Remove email;
          CacheHelper.removeData(key: CacheHelperKeys.email).then((value) {
            Constants.email = "";
          });
          // Remove uId;
          CacheHelper.removeData(key: CacheHelperKeys.uId).then(
            (value) {
              Constants.uId = "";
            },
          );
          setState(() {
            login2AccountWidget();
          });
        }
      },
      builder: (context, state) {
        HomeLayoutCubit cubit = HomeLayoutCubit.get(context);
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              width: double.infinity,
              height: 100.0,
              padding: const EdgeInsetsDirectional.all(AppPadding.p8),
              decoration: BoxDecoration(
                color: ColorManager.lightPrimary.withOpacity(.5),
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(JsonAssets.login),
                  const SizedBox(
                    width: 5.0,
                  ),
                  if (Constants.token.isEmpty || state is LogoutDoneState)
                    login2AccountWidget()
                  else
                    Conditional.single(
                      context: context,
                      conditionBuilder: (BuildContext context) =>
                          state is! GetProfileLoadingState,
                      widgetBuilder: (BuildContext context) {
                        return userData(
                          userInfo: cubit.userProfileModel.data?.user,
                        );
                      },
                      fallbackBuilder: (BuildContext context) {
                        return const DefaultLoading();
                      },
                    ),
                ],
              ),
            ),
            if (Constants.token.isNotEmpty && state is! LogoutDoneState)
              logoutWidget()
            else
              const SizedBox(),
          ],
        );
      },
    );
  }

  Widget login2AccountWidget() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MText(
            text: AppStrings.loginNow2YourAccount,
          ),
          DefaultButton(
            function: () {
              navigateTo(context, const LoginScreen());
            },
            text: AppStrings.login.tr(),
            width: 90.0,
          ),
        ],
      ),
    );
  }

  Widget logoutWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
                listener: (context, state) {
                  if (state is LogoutDoneState) {
                    Navigator.of(context).pop();
                  }
                },
                builder: (context, state) {
                  HomeLayoutCubit cubit = HomeLayoutCubit.get(context);
                  return AlertDialog(
                    title: MText(
                      text: AppStrings.confirmationLogout,
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MText(
                          text: AppStrings.areYouSureYouWantToLogout,
                        ),
                        state is LogoutLoadingState
                            ? const DefaultLoading()
                            : Container(),
                        state is LogoutErrorState
                            ? MText(
                                text: AppStrings
                                    .somethingsErrorPleaseCheckYourInternet,
                                maxLines: 2,
                              )
                            : Container()
                      ],
                    ),
                    actions: [
                      DTextButton(
                        text: AppStrings.yes.tr(),
                        function: () {
                          cubit.logout();
                          setState(() {});
                        },
                      ),
                      DTextButton(
                        text: AppStrings.no.tr(),
                        function: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MText(
              text: AppStrings.logout,
              style: getRegularStyle(
                  color: ColorManager.white, fontSize: AppSize.s8),
            ),
            const SizedBox(
              width: AppSize.s4,
            ),
            const Icon(
              Icons.logout,
              color: ColorManager.white,
              size: AppSize.s16,
            ),
          ],
        ),
      ),
    );
  }

  Widget userData({
    UserInfo? userInfo,
  }) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText(
            text: userInfo?.fullName ??
                CacheHelper.getData(key: CacheHelperKeys.fullName),
            color: ColorManager.darkPrimary,
          ),
          MText(
            text: userInfo?.email ??
                CacheHelper.getData(key: CacheHelperKeys.email),
            color: ColorManager.darkPrimary,
          ),
        ],
      ),
    );
  }

  Widget languageSettings() {
    return Row(
      children: [
        const SizedBox(
          width: 4.0,
        ),
        MText(text: AppStrings.appLanguage),
        const SizedBox(
          width: AppSize.s12,
        ),
        DottedBorder(
          radius: const Radius.circular(AppSize.s8),
          color: ColorManager.darkPrimary,
          borderType: BorderType.RRect,
          child: Container(
            decoration: getDeco(),
            width: 140.0,
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: getDeco(
                    color:
                        Langs.isEN ? ColorManager.white : ColorManager.primary,
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (Langs.isEN) {
                        Langs.changeLang(context);
                        setState(() {
                          Phoenix.rebirth(context);
                        });
                      } else {
                        showToast(
                          text: 'الوضع الحالي هو العربية!',
                          state: ToastStates.WARNING,
                        );
                      }
                    },
                    child: MText(
                      text: AppStrings.arabic,
                      style: getBoldStyle(
                        color: Langs.isEN
                            ? ColorManager.primary
                            : ColorManager.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: getDeco(
                    color:
                        Langs.isEN ? ColorManager.primary : ColorManager.white,
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (!Langs.isEN) {
                        Langs.changeLang(context);
                        setState(() {
                          Phoenix.rebirth(context);
                        });
                      } else {
                        showToast(
                          text: 'You are already in English Mode',
                          state: ToastStates.WARNING,
                        );
                      }
                    },
                    child: MText(
                      text: AppStrings.english,
                      style: getBoldStyle(
                        color: Langs.isEN
                            ? ColorManager.white
                            : ColorManager.primary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

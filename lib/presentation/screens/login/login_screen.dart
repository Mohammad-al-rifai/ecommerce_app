// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/data/network/local/cache_helper.dart';
import 'package:ecommerce/data/network/local/keys.dart';
import 'package:ecommerce/presentation/components/button.dart';
import 'package:ecommerce/presentation/components/my_divider.dart';
import 'package:ecommerce/presentation/components/text_form_field.dart';
import 'package:ecommerce/presentation/components/toast_notifications.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/constants_manager.dart';
import 'package:ecommerce/presentation/resources/string_manager.dart';
import 'package:ecommerce/presentation/resources/styles_manager.dart';
import 'package:ecommerce/presentation/screens/register/forget_password_screen.dart';
import 'package:ecommerce/presentation/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/text_button.dart';
import '../../layouts/home_layout/home_layout.dart';
import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';
import 'login_cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.login.tr(),
          style:
              getBlackStyle(color: ColorManager.primary, fontSize: AppSize.s18),
        ),
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginDoneState) {
              showToast(
                text: state.loginModel!.message!,
                state: ToastStates.SUCCESS,
              );
              if (state.loginModel!.status!) {
                CacheHelper.saveData(
                  key: CacheHelperKeys.token,
                  value: state.loginModel?.data?.token,
                ).then((value) {
                  // Update Token Value Here ✅
                  Constants.token = state.loginModel!.data!.token!;
                  navigateAndFinish(context, const HomeLayout());
                });

                // FullName:
                CacheHelper.saveData(
                  key: CacheHelperKeys.fullName,
                  value: state.loginModel?.data?.user?.fullName,
                ).then((value) {
                  Constants.fullName = state.loginModel?.data?.user?.fullName;
                });

                // Email:
                CacheHelper.saveData(
                  key: CacheHelperKeys.email,
                  value: state.loginModel?.data?.user?.email,
                ).then((value) {
                  Constants.email = state.loginModel?.data?.user?.email;
                });

                // uId:
                CacheHelper.saveData(
                  key: CacheHelperKeys.uId,
                  value: state.loginModel?.data?.user?.sId,
                ).then((value) {
                  Constants.uId = state.loginModel?.data?.user?.sId;
                });
              }
            }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: AppSize.s180,
                          width: AppSize.s180,
                          child: Image(
                            image: AssetImage(
                              ImageAssets.splashLogo,
                            ),
                          ),
                        ),
                        TFF(
                          controller: emailController,
                          label: AppStrings.emailOrUsername.tr(),
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icons.email_outlined,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Email Must not be empty';
                            }
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s18,
                        ),
                        TFF(
                          controller: passwordController,
                          isPassword: isPassword,
                          label: AppStrings.password.tr(),
                          prefixIcon: Icons.lock,
                          suffix: isPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          suffixPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Password Must not be empty';
                            }
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s18,
                        ),
                        DefaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          text: AppStrings.login.tr(),
                          isLoading: state is LoginLoadingState,
                          isUpperCase: true,
                        ),
                        DTextButton(
                          text: AppStrings.forgetPassword.tr(),
                          function: () {
                            navigateTo(context, const ForgetPasswordScreen());
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyDivider(width: getScreenWidth(context) / 3),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p8,
                              ),
                              child: Text(
                                AppStrings.or.tr(),
                                style:
                                    getBoldStyle(color: ColorManager.primary),
                              ),
                            ),
                            MyDivider(width: getScreenWidth(context) / 3),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.doNotHaveAccount.tr(),
                              style: getRegularStyle(
                                color: ColorManager.primary,
                              ),
                            ),
                            DTextButton(
                              text: AppStrings.register.tr(),
                              function: () {
                                navigateAndFinish(
                                  context,
                                  const RegisterScreen(),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/app/validations/validations.dart';
import 'package:ecommerce/domain/requests/forget_password_request.dart';
import 'package:ecommerce/presentation/components/my_text.dart';
import 'package:ecommerce/presentation/components/text_form_field.dart';
import 'package:ecommerce/presentation/components/toast_notifications.dart';
import 'package:ecommerce/presentation/resources/string_manager.dart';
import 'package:ecommerce/presentation/screens/login/login_screen.dart';
import 'package:ecommerce/presentation/screens/register/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/button.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  ForgetPasswordRequest forgetPasswordRequest = ForgetPasswordRequest(
    email: '',
    pin: '',
    newPassword: '',
  );

  List<Widget> boarding = [];

  ScrollPhysics scrollPhysics = const NeverScrollableScrollPhysics();

  @override
  void initState() {
    boarding.add(getBody(context));
    boarding.add(forgetPassword(context));
    super.initState();
  }

  var boardController = PageController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.forgetPassword.tr(),
          style:
              getBlackStyle(color: ColorManager.primary, fontSize: AppSize.s18),
        ),
      ),
      body: onBoarding(),
    );
  }

  getBody(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is MailVerificationDoneState) {
          setState(() {
            scrollPhysics = const BouncingScrollPhysics();
            boardController.nextPage(
              duration: const Duration(
                milliseconds: 750,
              ),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          });
        }
      },
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MText(
                      text: AppStrings.enterYourEmailAddress,
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    TFF(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      label: AppStrings.email.tr(),
                      prefixIcon: Icons.email,
                      validator: (String value) {
                        if (!Validations.isEmailValid(value)) {
                          return 'Your Email Not Valid!';
                        }
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: DefaultButton(
                        width: getScreenWidth(context) / 3,
                        function: () {
                          if (formKey.currentState!.validate()) {
                            RegisterCubit.get(context)
                                .sendCode2mail(email: emailController.text);
                          }
                        },
                        text: AppStrings.send.tr(),
                        isUpperCase: true,
                        isLoading: state is MailVerificationLoadingState,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget forgetPassword(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is ForgetPasswordDoneState) {
          showToast(
              text: AppStrings.yourPasswordHasBeenChangedSuccess.tr(),
              state: ToastStates.SUCCESS);
          navigateAndFinish(context, const LoginScreen());
        }
      },
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  MText(text: AppStrings.emailVerificationCodeIsSentTo),
                  MText(
                      text: emailController.text,
                      style: getLightStyle(color: ColorManager.primary)),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  TFF(
                    controller: pinController,
                    keyboardType: TextInputType.number,
                    label: AppStrings.typeCodeHere.tr(),
                    prefixIcon: Icons.verified_user_sharp,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Code Must not be Empty';
                      }
                    },
                  ),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  TFF(
                    controller: newPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: isPassword,
                    label: AppStrings.newPassword.tr(),
                    prefixIcon: Icons.lock,
                    suffix:
                        isPassword ? Icons.visibility : Icons.visibility_off,
                    suffixPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    validator: (String value) {
                      if (!Validations.isPassword(value)) {
                        return 'Your password is incorrect';
                      }
                    },
                  ),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: DefaultButton(
                      width: getScreenWidth(context) / 3,
                      function: () {
                        if (formKey2.currentState!.validate()) {
                          forgetPasswordRequest.email = emailController.text;
                          forgetPasswordRequest.pin = pinController.text;
                          forgetPasswordRequest.newPassword =
                              newPasswordController.text;

                          RegisterCubit.get(context).forgetPassword(
                              forgetPasswordRequest: forgetPasswordRequest);
                        }
                      },
                      text: AppStrings.send.tr(),
                      isUpperCase: true,
                      isLoading: state is ForgetPasswordLoadingState,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget onBoarding() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: boardController,
              onPageChanged: (int index) {},
              physics: scrollPhysics,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return getBody(context);
                } else {
                  return forgetPassword(context);
                }
              },
              itemCount: boarding.length,
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Row(
            children: [
              SmoothPageIndicator(
                controller: boardController,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: ColorManager.primary,
                  dotHeight: 10.0,
                  dotWidth: 10.0,
                  spacing: 5,
                  expansionFactor: 4,
                ),
                count: boarding.length,
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

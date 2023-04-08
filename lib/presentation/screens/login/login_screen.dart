// ignore_for_file: must_be_immutable

import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/data/network/local/cache_helper.dart';
import 'package:ecommerce/presentation/components/button.dart';
import 'package:ecommerce/presentation/components/text_form_field.dart';
import 'package:ecommerce/presentation/components/toast_notifications.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/constants_manager.dart';
import 'package:ecommerce/presentation/resources/styles_manager.dart';
import 'package:ecommerce/presentation/screens/home/home_screen.dart';
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
          'Login',
          style:
              getBlackStyle(color: ColorManager.white, fontSize: AppSize.s18),
        ),
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            // if (state is LoginDoneState) {
            //   showToast(text: 'Log in Success', state: ToastStates.SUCCESS);
            //   if (state.loginModel?.status == 'success') {
            //     CacheHelper.saveData(
            //       key: 'token',
            //       value: state.loginModel?.data?.token,
            //     ).then((value) {
            //       // Update Token Value Here ✅
            //       Constants.token = state.loginModel!.data!.token!;
            //     });
            //   }
            // }
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
                          label: 'Email',
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
                          label: 'Password',
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
                            // if (formKey.currentState!.validate()) {
                            //   LoginCubit.get(context).login(
                            //     email: emailController.text,
                            //     password: passwordController.text,
                            //   );
                            // }
                            navigateAndFinish(context, const HomeLayout());
                          },
                          text: 'login',
                          isLoading: state is LoginLoadingState,
                          isUpperCase: true,
                        ),
                        const SizedBox(
                          height: AppSize.s18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t Have Account? ',
                              style: getRegularStyle(
                                color: ColorManager.primary,
                              ),
                            ),
                            DTextButton(
                              text: 'Register',
                              function: () {
                                print('Register Now===');
                                navigateAndFinish(
                                    context, const RegisterScreen());
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

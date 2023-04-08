// ignore_for_file: must_be_immutable

import 'package:ecommerce/app/functions.dart';
import 'package:ecommerce/presentation/components/button.dart';
import 'package:ecommerce/presentation/components/text_form_field.dart';
import 'package:ecommerce/presentation/resources/styles_manager.dart';
import 'package:ecommerce/presentation/screens/home/home_screen.dart';
import 'package:ecommerce/presentation/screens/register/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/network/local/cache_helper.dart';
import '../../../domain/requests/register_request.dart';
import '../../components/toast_notifications.dart';
import '../../layouts/home_layout/home_layout.dart';
import '../../resources/color_manager.dart';
import '../../resources/constants_manager.dart';
import '../../resources/values_manager.dart';

class MailVerifyScreen extends StatefulWidget {
  MailVerifyScreen({Key? key, required this.registerRequest}) : super(key: key);
  RegisterRequest registerRequest;

  @override
  State<MailVerifyScreen> createState() => _MailVerifyScreenState();
}

class _MailVerifyScreenState extends State<MailVerifyScreen> {
  TextEditingController codeController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mail Verification',
        ),
      ),
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          // if (state is RegisterDoneState) {
          //   if (state.registerModel?.status == 'success') {
          //     showToast(text: 'Register Success', state: ToastStates.SUCCESS);
          //     CacheHelper.saveData(
          //       key: 'token',
          //       value: state.registerModel?.data?.token,
          //     ).then((value) {
          //       // Update Token Value Here ✅
          //       Constants.token = state.registerModel!.data!.token!;
          //       navigateAndFinish(context, const HomeLayout());
          //     });
          //   } else {
          //     showToast(
          //       text: state.registerModel!.message!,
          //       state: ToastStates.ERROR,
          //     );
          //   }
          // }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        'You Are Send Email Code Verification To:',
                        style: getBoldStyle(
                          color: ColorManager.primary,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      Text(
                        widget.registerRequest.email,
                        style: getExtraLightStyle(
                          color: ColorManager.primary,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      Text(
                        'Please Check your Mail Box',
                        style: getExtraLightStyle(
                          color: ColorManager.primary,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s12,
                      ),
                      TFF(
                        controller: codeController,
                        label: 'Email Code Verification Here',
                        prefixIcon: Icons.verified_user_sharp,
                        keyboardType: TextInputType.number,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'This Code wrong Please Enter Correct Code.';
                          }
                        },
                      ),
                      const SizedBox(
                        height: AppSize.s12,
                      ),
                      DefaultButton(
                        function: () {
                          // print(
                          //     'cubit.mailVerificationModel?.pin: ${cubit.mailVerificationModel?.pin}');
                          // if (formKey.currentState!.validate()) {
                          //   if (cubit.mailVerificationModel?.pin ==
                          //       codeController.text) {
                          //     cubit.register(
                          //       registerRequest: widget.registerRequest,
                          //     );
                          //   } else {
                          //     showToast(
                          //         text: 'Not Valid', state: ToastStates.ERROR);
                          //   }
                          // }

                          navigateAndFinish(context, const HomeLayout());
                        },
                        text: 'Register Now',
                        isLoading: state is RegisterLoadingState,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/presentation/components/button.dart';
import 'package:ecommerce/presentation/components/text_form_field.dart';
import 'package:ecommerce/presentation/resources/string_manager.dart';
import 'package:ecommerce/presentation/resources/styles_manager.dart';
import 'package:ecommerce/presentation/screens/register/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/functions.dart';
import '../../../data/network/local/cache_helper.dart';
import '../../../data/network/local/keys.dart';
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
        title: Text(
          AppStrings.mailVerification.tr(),
        ),
      ),
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterDoneState) {
            showToast(
              text: state.registerModel!.message!,
              state: ToastStates.SUCCESS,
            );
            if (state.registerModel!.status!) {
              CacheHelper.saveData(
                key: CacheHelperKeys.token,
                value: state.registerModel?.data?.token,
              ).then((value) {
                // Update Token Value Here ✅
                Constants.token = state.registerModel!.data!.token!;
                navigateAndFinish(context, const HomeLayout());
              });

              // FullName:
              CacheHelper.saveData(
                key: CacheHelperKeys.fullName,
                value: state.registerModel?.data?.user?.fullName,
              ).then((value) {
                Constants.fullName = state.registerModel?.data?.user?.fullName;
              });

              // Email:
              CacheHelper.saveData(
                key: CacheHelperKeys.email,
                value: state.registerModel?.data?.user?.email,
              ).then((value) {
                Constants.email = state.registerModel?.data?.user?.email;
              });

              // uId:
              CacheHelper.saveData(
                key: CacheHelperKeys.uId,
                value: state.registerModel?.data?.user?.sId,
              ).then((value) {
                Constants.uId = state.registerModel?.data?.user?.sId;
              });
            }
          }
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
                        AppStrings.emailVerificationCodeIsSentTo.tr(),
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
                        AppStrings.pleaseCheckMailBox.tr(),
                        style: getExtraLightStyle(
                          color: ColorManager.primary,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s12,
                      ),
                      TFF(
                        controller: codeController,
                        label: AppStrings.typeCodeHere.tr(),
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
                          if (formKey.currentState!.validate()) {
                            widget.registerRequest.pin = codeController.text;
                            cubit.register(
                              registerRequest: widget.registerRequest,
                            );
                          }
                        },
                        text: AppStrings.registerNow.tr(),
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

import 'package:ecommerce/domain/requests/register_request.dart';
import 'package:ecommerce/presentation/screens/login/login_screen.dart';
import 'package:ecommerce/presentation/screens/register/mail_verify_screen.dart';
import 'package:ecommerce/presentation/screens/register/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/functions.dart';
import '../../components/button.dart';
import '../../components/text_button.dart';
import '../../components/text_form_field.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  RegisterRequest registerRequest = RegisterRequest(
    name: '',
    password: '',
    email: '',
    phone: '',
    location: '',
    address: 'sahgdhsavdhass#4svdh43#',
  );

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  String codeMail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style:
              getBlackStyle(color: ColorManager.white, fontSize: AppSize.s18),
        ),
      ),
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
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
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                      TFF(
                        controller: nameController,
                        label: 'Name',
                        prefixIcon: Icons.person,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Name Must not be empty';
                          }
                        },
                      ),
                      const SizedBox(
                        height: AppSize.s18,
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
                      TFF(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        label: 'Phone',
                        prefixIcon: Icons.call,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Phone Must not be empty';
                          }
                        },
                      ),
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                      TFF(
                        controller: locationController,
                        label: 'Location',
                        prefixIcon: Icons.location_on,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Location Must not be empty';
                          }
                        },
                      ),
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                      DefaultButton(
                        function: () {
                          // if (formKey.currentState!.validate()) {
                          //   registerRequest.name = nameController.text;
                          //   registerRequest.email = emailController.text;
                          //   registerRequest.password = passwordController.text;
                          //   registerRequest.phone = phoneController.text;
                          //   registerRequest.location = locationController.text;
                          //   RegisterCubit.get(context).sendCode2mail(
                          //     email: emailController.text,
                          //   );
                          navigateTo(
                              context,
                              MailVerifyScreen(
                                registerRequest: registerRequest,
                              ));
                          // }
                        },
                        text: 'Register',
                        isLoading: state is MailVerificationLoadingState,
                        isUpperCase: true,
                      ),
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have Account? ',
                            style: getRegularStyle(
                              color: ColorManager.primary,
                            ),
                          ),
                          DTextButton(
                            text: 'login',
                            function: () {
                              print('Login Now===');
                              navigateAndFinish(context, const LoginScreen());
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
    );
  }
}

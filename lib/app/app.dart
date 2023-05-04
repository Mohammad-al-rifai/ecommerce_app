import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/presentation/layouts/merchant_layout/merchant_layout_cubit/merchant_layout_cubit.dart';
import 'package:ecommerce/presentation/screens/register/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/layouts/home_layout/home_layout_cubit/home_layout_cubit.dart';
import '../presentation/resources/theme_manager.dart';
import '../presentation/screens/splash/splash_screen.dart';

class MyApp extends StatefulWidget {
  // named Constructor

  const MyApp._internal();

  static const MyApp _instance =
      MyApp._internal(); // Singleton or Single Instance.

  factory MyApp() => _instance; //factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => RegisterCubit()),
        BlocProvider(
          create: (BuildContext context) => HomeLayoutCubit()
            ..getBanners()
            ..getCategories()
            ..getHotSelling()
            ..getProfile()
            ..getMerchant(),
        ),
        BlocProvider(create: (BuildContext context) => MerchantLayoutCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const SplashScreen(),
      ),
    );
  }
}

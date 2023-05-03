import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/data/network/local/cache_helper.dart';
import 'package:ecommerce/data/network/local/keys.dart';
import 'package:flutter/material.dart';

class Langs {
  static bool isEN = true;

  static changeLang(BuildContext context) {
    if (context.locale == const Locale('en', 'US')) {
      isEN = false;
      CacheHelper.saveData(key: CacheHelperKeys.isEN, value: isEN);
      context.setLocale(const Locale('ar', 'SA'));
    } else {
      isEN = true;
      CacheHelper.saveData(key: CacheHelperKeys.isEN, value: isEN);
      context.setLocale(const Locale('en', 'US'));
    }
  }
}

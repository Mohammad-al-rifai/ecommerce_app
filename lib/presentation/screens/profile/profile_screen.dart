import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('profile'.tr()),
          IconButton(
            onPressed: () {
              if (context.locale == const Locale('en', 'US')) {
                context.setLocale(const Locale('ar', 'SA'));
              } else {
                context.setLocale(const Locale('en', 'US'));
              }
              setState(() {
                Phoenix.rebirth(context);
              });
            },
            icon: const Icon(Icons.language),
          ),
        ],
      ),
    );
  }
}

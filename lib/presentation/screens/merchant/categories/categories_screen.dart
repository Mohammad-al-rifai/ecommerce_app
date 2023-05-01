import 'package:flutter/material.dart';

class MerchantCategoriesScreen extends StatefulWidget {
  const MerchantCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<MerchantCategoriesScreen> createState() =>
      _MerchantCategoriesScreenState();
}

class _MerchantCategoriesScreenState extends State<MerchantCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Categories Screen'),
    );
  }
}

import 'package:flutter/cupertino.dart';

class TemplateList extends StatelessWidget {
  const TemplateList({
    Key? key,
    required this.list,
    required this.listItem,
    this.isHorizontal = false,
  }) : super(key: key);

  final List<dynamic> list;
  final Widget listItem;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
      itemBuilder: (context, index) => listItem,
      itemCount: list.length,
    );
  }
}

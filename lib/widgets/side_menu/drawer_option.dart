import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
class DrawerOptions extends StatelessWidget {
DrawerOptions(
    {super.key,
      required this.iconName,
      required this.icon,
      required this.onTap});
late String iconName;
late Icon icon;
late VoidCallback onTap;
@override
Widget build(BuildContext context) {
  return ListTile(
    title: Text(
      iconName,
      style: kDrawerTextStyle,
    ),
    leading: icon,
    onTap: onTap,
  );
}
}
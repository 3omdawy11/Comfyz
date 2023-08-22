import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
class SideMenuIcon extends StatelessWidget {
  const SideMenuIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.menu,
        size: kIconSize,
      ),
      onPressed: () {
        // Open the drawer
        Scaffold.of(context).openDrawer();
      },
    );
  }
}

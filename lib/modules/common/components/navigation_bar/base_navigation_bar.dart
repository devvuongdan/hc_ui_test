import 'package:flutter/material.dart';

import 'package:hcm_ui_test/gen/assets.gen.dart';
part './base_navigation_bar_configs.dart';

class VDNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const VDNavigationBar.avtAndLogo({super.key, required this.configs});

  static double getNavigationTopHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  final VDNavigationBarConfigs configs;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: configs.avtLeading,
      leadingWidth: configs.leadingWidth,
      backgroundColor: configs.backgroundColor,
      elevation: 0,
      title: configs.title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hcm_ui_test/gen/assets.gen.dart';

import '../../../../common/export_packages.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onSelect;
  const HomeBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    this.onSelect,
  }) : super(key: key);

  Color getSelectedTabColors(bool isSelected) {
    return isSelected ? const Color(0xffF2FE8D) : const Color(0xffFFFFFF);
  }

  @override
  Widget build(BuildContext context) {
    return BottomBarBubble(
      height: 82,
      selectedIndex: selectedIndex,
      bubbleSize: 10,
      color: const Color(0xffF2FE8D),
      items: [
        BottomBarItem(
          iconBuilder: (color) {
            return Assets.mocks.images.tabBarHome
                .image(color: getSelectedTabColors(selectedIndex == 0));
          },
        ),
        BottomBarItem(
          iconBuilder: (color) {
            return Assets.mocks.images.tabBarBag
                .image(color: getSelectedTabColors(selectedIndex == 1));
          },
        ),
        BottomBarItem(
          iconBuilder: (color) {
            return Assets.mocks.images.tabBarCard
                .image(color: getSelectedTabColors(selectedIndex == 2));
          },
        ),
        BottomBarItem(
          iconBuilder: (color) {
            return Assets.mocks.images.tabBarChat
                .image(color: getSelectedTabColors(selectedIndex == 3));
          },
        ),
        BottomBarItem(
          iconBuilder: (color) {
            return Assets.mocks.images.tabBarTime
                .image(color: getSelectedTabColors(selectedIndex == 4));
          },
        ),
      ],
      onSelect: onSelect,
    );
  }
}

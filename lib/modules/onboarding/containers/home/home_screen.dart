import 'package:flutter/material.dart';
import 'package:hcm_ui_test/modules/common/export_packages.dart';
import 'package:hcm_ui_test/modules/onboarding/containers/home/widget/home_action_sheet.dart';

import 'widget/home_balance.dart';
import 'widget/home_bottom_navigation_bar.dart';
import 'widget/home_cards.dart';
import 'widget/home_finance.dart';
import 'widget/home_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scaffoldBuilder: () {
        return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: const Color(0xFF252626),
            body: _buildBody(selectedIndex),
            bottomNavigationBar: HomeBottomNavigationBar(
              selectedIndex: selectedIndex,
              onSelect: (p0) {
                setState(() {
                  selectedIndex = p0;
                });
              },
            ));
      },
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return _buildHomeTab();
      default:
        return Container();
    }
  }

  Widget _buildHomeTab() {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 32),
      children: [
        Container(
          height: 24,
          color: const Color(0xFF1E1F1F),
        ),
        HomeNavigationBar(context: context),
        const HomeBalance(),
        Container(
          height: 28,
          color: const Color(0xFF1E1F1F),
        ),
        HomeMediumCards(),
        Container(
          height: 39,
          color: const Color(0xFF1E1F1F),
        ),
        HomeFincance(),
        const HomeActionSheet()
      ],
    );
  }
}

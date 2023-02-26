import 'package:flutter/material.dart';
import 'package:hcm_ui_test/gen/assets.gen.dart';

import 'package:hcm_ui_test/modules/common/themes/typography/textstyle_ext.dart';
import 'package:hcm_ui_test/modules/onboarding/l10n/generated/l10n.dart';

import '../../../../common/export_packages.dart';

class HomeFincance extends StatelessWidget {
  HomeFincance({
    required this.cards,
    Key? key,
  }) : super(key: key);

  List<VDCardSmallConfigs>? cards;

  @override
  Widget build(BuildContext context) {
    final List<VDCardSmallConfigs> cardsList = cards ??
        <VDCardSmallConfigs>[
          VDCardSmallConfigs(
            color: const Color(0xFFF2FE8D),
            icon: Assets.mocks.images.star.image(),
            title: "My bonuses",
          ),
          VDCardSmallConfigs(
            color: const Color(0xFFB2D0CE),
            icon: Assets.mocks.images.wallet.image(),
            title: "My budget",
          ),
          VDCardSmallConfigs(
            color: const Color(0xFFAA9E87),
            icon: Assets.mocks.images.chart.image(),
            title: "Finance analysis",
          ),
          VDCardSmallConfigs(
            color: const Color(0xFFF2FE8D),
            icon: Assets.mocks.images.star.image(),
            title: OnboardingLocalizations.current.testLocal,
          ),
        ];
    return Container(
      color: const Color(0xFF1E1F1F),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("FINANCE", style: const TextStyle().Ca10Me)),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              itemBuilder: (_, idx) {
                return VDCard(
                  size: VDCardSize.small,
                  smallConfigs: cardsList[idx],
                );
              },
              separatorBuilder: (_, sidx) => const SizedBox(
                width: 14,
              ),
              itemCount: cardsList.length,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hcm_ui_test/gen/assets.gen.dart';
import 'package:hcm_ui_test/modules/common/themes/typography/textstyle_ext.dart';

part './base_card_configs.dart';

enum VDCardSize {
  medium,
  small,
  big,
}

class VDCard extends StatelessWidget {
  const VDCard({
    super.key,
    required this.size,
    this.mediumConfigs,
    this.smallConfigs,
    this.bigConfigs,
  }) : assert((size == VDCardSize.medium &&
                mediumConfigs != null &&
                smallConfigs == null &&
                bigConfigs == null) ||
            (size == VDCardSize.small &&
                mediumConfigs == null &&
                smallConfigs != null &&
                bigConfigs == null) ||
            (size == VDCardSize.big &&
                mediumConfigs == null &&
                smallConfigs == null &&
                bigConfigs != null));

  final VDCardSize size;

  final VDCardMediumConfigs? mediumConfigs;
  final VDCardSmallConfigs? smallConfigs;
  final VDCardBigConfigs? bigConfigs;

  static double getNavigationTopHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  @override
  Widget build(BuildContext context) {
    switch (size) {
      // FIXME: TRONG LIBRARY ĐỂ MÀU LÀ SOLID NHƯNG TRÊN HOME DESIGN LẠI LÀ MÀU GRADIENT ???
      case VDCardSize.medium:
        return Container(
          height: 170,
          width: 148,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            // color: Colors.blue,
            borderRadius: BorderRadius.circular(
              30,
            ),
            gradient: LinearGradient(
              colors: mediumConfigs!.gradientColor,
              stops: const [0, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCardLogo(mediumConfigs!.type),
              const Spacer(),
              Text(
                mediumConfigs!.category,
                style: const TextStyle()
                    .Ca11Me
                    .copyWith(color: const Color(0xFF272A32)),
              ),
              Text(
                "${mediumConfigs!.currency} ${mediumConfigs!.balance}",
                style: const TextStyle()
                    .Bo17B
                    .copyWith(color: const Color(0xFF272A32)),
              ),
              const Spacer(),
              Text(
                mediumConfigs!.hidenNumber,
                style: const TextStyle()
                    .Ca11Me
                    .copyWith(color: const Color(0xFF272A32)),
              ),
            ],
          ),
        );

      case VDCardSize.small:
        return Container(
          padding:
              const EdgeInsets.only(top: 16, bottom: 14, left: 16, right: 14),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              26,
            ),
            color: const Color(0XFF252626),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: smallConfigs!.color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: smallConfigs?.icon,
              ),
              const Spacer(),
              SizedBox(
                height: 24,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    smallConfigs?.title ?? "",
                    style: const TextStyle().Ca11Me,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        );

      default:
        return Container();
    }
  }

  Widget getCardLogo(CardType type) {
    switch (type) {
      default:
        return Assets.mocks.images.visa.image(
          color: const Color(0XFF272A32),
          // height: 20,
          width: 40,
          fit: BoxFit.fill,
        );
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hcm_ui_test/modules/common/export_packages.dart';

class HomeMediumCards extends StatelessWidget {
  HomeMediumCards({
    Key? key,
    List<VDCardMediumConfigs>? cards,
  })  : _cards = cards ?? mockMediumCards,
        super(key: key);

  final List<VDCardMediumConfigs> _cards;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1E1F1F),
      height: 170,
      // color: Colors.grey,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        itemBuilder: (_, idx) {
          return VDCard(
            size: VDCardSize.medium,
            mediumConfigs: _cards[idx],
          );
        },
        separatorBuilder: (_, sidx) => const SizedBox(
          width: 13,
        ),
        itemCount: _cards.length,
      ),
    );
  }
}

List<VDCardMediumConfigs> mockMediumCards = <VDCardMediumConfigs>[
  VDCardMediumConfigs(
    category: "Salary",
    currency: "\$",
    balance: "2,230",
    fullNumber: "",
    hidenNumber: "** 6917",
    gradientColor: [
      const Color(0XFFEAEAEA),
      const Color(0XFFB2D0CE),
    ],
  ),
  VDCardMediumConfigs(
    category: "Savings account",
    currency: "\$",
    balance: "5,566",
    fullNumber: "",
    hidenNumber: "** 4552",
    gradientColor: [
      const Color(0XFFFCFFDF),
      const Color(0XFFF1FE87),
    ],
  ),
  VDCardMediumConfigs(
    category: "Salary",
    currency: "\$",
    balance: "2,230",
    fullNumber: "",
    hidenNumber: "** 6919",
    gradientColor: [
      const Color(0XFFF2EFF4),
      const Color(0xFFB8A9C6),
    ],
  ),
];

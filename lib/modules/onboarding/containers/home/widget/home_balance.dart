import 'package:flutter/material.dart';
import 'package:hcm_ui_test/gen/assets.gen.dart';
import 'package:hcm_ui_test/modules/common/themes/typography/textstyle_ext.dart';

class HomeBalance extends StatelessWidget {
  const HomeBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 52,
      color: const Color(0xFF1E1F1F),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Your balance", style: const TextStyle().Bo15Re),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ 7,896", style: const TextStyle().He25B),
              //FIXME: TRÊN DESIGN VẪN HIỆN CÓ LINK VỚI LIB, NHƯNG COMPONENT NÀY BỊ XOÁ RỒI THÌ PHẢI
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFFFFFF).withOpacity(0.07),
                ),
                child: Assets.mocks.images.search.image(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

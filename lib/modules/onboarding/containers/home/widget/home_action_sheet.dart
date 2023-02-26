import 'package:flutter/material.dart';
import 'package:hcm_ui_test/gen/assets.gen.dart';
import 'package:hcm_ui_test/modules/common/themes/typography/textstyle_ext.dart';

class HomeActionSheet extends StatelessWidget {
  const HomeActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFF1E1F1F),
          height: 68,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFF252626),
                  //FIXME: KHÔNG GET ĐƯỢC BORDER CỦA VIEW NÀY !!!
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          // height: 644,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            children: [
              _buildCurrentLoanView(),
              const SizedBox(
                height: 16,
              ),
              _buildAD(),
              const SizedBox(
                height: 36,
              ),
              _buildCurrencesAndMetalsView()
            ],
          ),
        ),
      ],
    );
  }

  Column _buildCurrentLoanView() {
    return Column(
      children: [
        Row(
          children: [
            //TODO: Em không rõ event chỗ này lắm, ấn vào đây nó expand ra thêm rồi quay đầu mũi tên lên trên hay sao?
            SizedBox(
              height: 20,
              width: 20,
              child: Assets.mocks.images.arrowDown.image(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text("Current loans".toUpperCase(),
                  style: const TextStyle().Ca10Me),
            ),
            const Spacer(),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFFFFF).withOpacity(0.07),
              ),
              child: Assets.mocks.images.plus.image(),
            ),
          ],
        ),
        const SizedBox(
          height: 11,
        ),
        Container(
          height: 76,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color(0xFF212121),
              borderRadius: BorderRadius.circular(26)),
          child: Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    color: const Color(0XFFB2D0CE),
                    borderRadius: BorderRadius.circular(12)),
                child: Assets.mocks.images.creditcard.image(),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Account № 3874825",
                        style: const TextStyle().Bo15Re,
                      ),
                      const Spacer(),
                      Text(
                        "\$ 78,925",
                        style: const TextStyle().Bo15Re,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Expires 12/22/2023",
                        style: const TextStyle()
                            .Ca12Re
                            .copyWith(color: const Color(0xFF79767D)),
                      ),
                      const Spacer(),
                      Text(
                        "Rate 3.5%",
                        style: const TextStyle()
                            .Ca12Re
                            .copyWith(color: const Color(0xFF79767D)),
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ],
    );
  }

  Stack _buildAD() {
    return Stack(
      children: [
        Container(
          // height: 76,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFB2D0CE),
                  Color(0xFFEAEAEA),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(26)),
          child: Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    color: const Color(0XFF242727),
                    borderRadius: BorderRadius.circular(12)),
                child: Assets.mocks.images.shazam.image(),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Start investing now!",
                    style: const TextStyle()
                        .Bo15Se
                        .copyWith(color: const Color(0XFF262626)),
                  ),
                  Text(
                    "Protected savings and investment plans",
                    style: const TextStyle()
                        .Ca12Re
                        .copyWith(color: const Color(0xFF262626)),
                  ),
                ],
              ))
            ],
          ),
        ),
        Positioned(top: 18, right: 18, child: Assets.mocks.images.x.image())
      ],
    );
  }

  Widget _buildTradingSrcIcon(String srcCode) {
    switch (srcCode) {
      case "USD":
        return Assets.mocks.images.usd.image();
      case "EUR":
        return Assets.mocks.images.eur.image();
      default:
        return Assets.mocks.images.metal.image();
    }
  }

  Row _buildCurSrc({
    required Widget icon,
    required String label,
  }) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: const Color(0XFFB2D0CE),
              borderRadius: BorderRadius.circular(8)),
          child: icon,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          label,
          style: const TextStyle().Bo15Re,
        )
      ],
    );
  }

  Column _buildCurrencesAndMetalsView() {
    return Column(
      children: [
        _buildTitle(),
        const SizedBox(
          height: 11,
        ),
        _buildTradingView(
          sectorName: "Currencie",
          pullLable: "USD",
          pushLable: "EUR",
          pullBuyAmount: "\$ 78,92",
          pullSellAmount: "\$ 78,92",
          pushBuyAmount: "\$ 78,92",
          pushSellAmount: "\$ 78,92",
        ),
        const SizedBox(
          height: 12,
        ),
        _buildTradingView(
          sectorName: "Metal",
          pullLable: "Gold",
          pushLable: "Silver",
          pullBuyAmount: "\$ 78,92",
          pullSellAmount: "\$ 78,92",
          pushBuyAmount: "\$ 78,92",
          pushSellAmount: "\$ 78,92",
        ),
      ],
    );
  }

  Row _buildTitle() {
    return Row(
      children: [
        //TODO: Em không rõ event chỗ này lắm, ấn vào đây nó expand ra thêm rồi quay đầu mũi tên lên trên hay sao?
        SizedBox(
          height: 20,
          width: 20,
          child: Assets.mocks.images.arrowDown.image(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text("Currencies and metals".toUpperCase(),
              style: const TextStyle().Ca10Me),
        ),
        const Spacer(),
      ],
    );
  }

  Container _buildTradingView({
    required String sectorName,
    required String pushLable,
    required String pullLable,
    required String pushBuyAmount,
    required String pullBuyAmount,
    required String pushSellAmount,
    required String pullSellAmount,
  }) {
    return Container(
      height: 116,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xFF212121),
          borderRadius: BorderRadius.circular(26)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sectorName,
                style: const TextStyle()
                    .Ca12Re
                    .copyWith(color: const Color(0xFF79767d)),
              ),
              const SizedBox(
                height: 12,
              ),
              _buildCurSrc(
                  icon: _buildTradingSrcIcon(pushLable), label: pushLable),
              const SizedBox(
                height: 8,
              ),
              _buildCurSrc(
                  icon: _buildTradingSrcIcon(pullLable), label: pullLable),
            ],
          ),
          const Spacer(),
          _buildTradingBalance(
            title: "Buy",
            pushBalance: pushBuyAmount,
            pullBalance: pullBuyAmount,
          ),
          const SizedBox(
            width: 32,
          ),
          _buildTradingBalance(
            title: "Sell",
            pushBalance: pushSellAmount,
            pullBalance: pullSellAmount,
          ),
        ],
      ),
    );
  }

  Column _buildTradingBalance({
    required String title,
    required String pushBalance,
    required String pullBalance,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style:
              const TextStyle().Ca12Re.copyWith(color: const Color(0xFF79767d)),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          pushBalance,
          style: const TextStyle().Bo15Re,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          pullBalance,
          style: const TextStyle().Bo15Re,
        ),
      ],
    );
  }
}

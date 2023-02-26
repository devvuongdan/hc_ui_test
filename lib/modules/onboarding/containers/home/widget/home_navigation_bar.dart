// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hcm_ui_test/gen/assets.gen.dart';
import 'package:hcm_ui_test/modules/common/export_packages.dart';
import 'package:hcm_ui_test/modules/common/localization/localization_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_app/restart_app.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  late final _localeCubit = context.read<LocalizationCubit>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1E1F1F),
      height: VDNavigationBar.getNavigationTopHeight(context) + 72,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TouchableOpacity(
                  onTap: () async {
                    _localeCubit.toggleLocale();
                    //FIXME: Chỉ sử dụng trong giai đoạn đầu do chưa rõ behavior của tính năng

                    await Future.delayed(const Duration(seconds: 2));

                    Platform.isIOS
                        ? Phoenix.rebirth(context)
                        : Restart.restartApp(webOrigin: '[your main route]');
                  },
                  child: Container(
                      height: 32,
                      width: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0XFFEDFC74),
                            Color(0XFFF5FFA8),
                          ],
                        ),
                      ),
                      child: Assets.mocks.images.avatar.image(
                        height: 32,
                        width: 32,
                        fit: BoxFit.contain,
                      )),
                ),
              ),
            ],
          ),
          Center(
            child: Assets.mocks.images.logo.image(
              width: 80,
              height: 24,
            ),
          )
        ],
      ),
    );
  }
}

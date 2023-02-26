import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hcm_ui_test/modules/common/export_packages.dart';

import '../../localization/index.dart';

class BaseScreen extends StatelessWidget {
  final Widget Function() scaffoldBuilder;
  final WillPopCallback? onWillPop;
  final SystemUiOverlayStyle? systemUiOverlayStyle;

  const BaseScreen({
    super.key,
    required this.scaffoldBuilder,
    this.onWillPop,
    this.systemUiOverlayStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (systemUiOverlayStyle != null) {
      SystemChrome.setSystemUIOverlayStyle(
        systemUiOverlayStyle!.copyWith(
          statusBarColor: Colors.transparent,
        ),
      );
    }

    return LocalizationListenerWidget(
      builder: () => BaseWillPopScope(
        onWillPop: onWillPop,
        child: scaffoldBuilder(),
      ),
    );
  }
}

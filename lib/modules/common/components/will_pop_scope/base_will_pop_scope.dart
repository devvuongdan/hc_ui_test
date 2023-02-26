import 'dart:io';

import 'package:flutter/material.dart';

class BaseWillPopScope extends WillPopScope {
  BaseWillPopScope({
    Key? key,
    required WillPopCallback? onWillPop,
    required Widget child,
  }) : super(
          key: key,
          onWillPop: onWillPop == null && Platform.isIOS
              ? null
              : () async {
                  // if (LoadingManager.shared.isShowing) return false;
                  //TODO: Implement LoadingManager!

                  final result = await onWillPop?.call();

                  return result ?? true;
                },
          child: child,
        );
}

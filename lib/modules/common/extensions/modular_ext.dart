import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
// ignore: implementation_imports
import 'package:flutter_modular/src/presenter/modular_base.dart';
import 'package:logger/logger.dart';

extension ModularBaseExt on IModularBase {
  B? getOrNull<B extends Object>({B? defaultValue}) {
    try {
      return get<B>(defaultValue: defaultValue);
    } catch (e) {
      Logger().e(e);

      return null;
    }
  }

  Future<B?> getAsyncOrNull<B extends Object>({B? defaultValue}) async {
    try {
      return await getAsync<B>(defaultValue: defaultValue);
    } catch (e) {
      Logger().e(e);

      return await Future.value(null);
    }
  }
}

extension ModularNavigatorExt on IModularNavigator {
  void popUntilWithResult<T extends Object?>(
    String routeName, {
    T? result,
  }) {
    try {
      // get reversed navigateHistory
      final reversedNavigateHistory = navigateHistory.reversed.toList();
      String? nextRouteName;
      int? targetRouteNameIndex;

      // find targetRouteNameIndex and nextRouteName
      for (var i = 0; i < reversedNavigateHistory.length; i++) {
        if (reversedNavigateHistory[i].name == routeName) {
          targetRouteNameIndex = i;
          if (i > 0) {
            nextRouteName = reversedNavigateHistory[i - 1].name;
          }
          break;
        }
      }

      // check not null and isNotEmpty
      if (nextRouteName == null ||
          nextRouteName.isEmpty ||
          targetRouteNameIndex == null ||
          targetRouteNameIndex < 0) return;

      final subNavigateHistory = reversedNavigateHistory.sublist(
        0,
        targetRouteNameIndex,
      );

      // find duplicate nextRouteName
      final numberOfDuplicateNextRouteName = subNavigateHistory
          .where((element) => element.name == nextRouteName)
          .toList()
          .length;

      // popUntil multiple times with numberOfDuplicateNextRouteName
      for (var i = 0; i < numberOfDuplicateNextRouteName; i++) {
        if (i == numberOfDuplicateNextRouteName - 1) {
          this
            ..popUntil(ModalRoute.withName(nextRouteName))
            ..pop(result);
        } else {
          this
            ..popUntil(ModalRoute.withName(nextRouteName))
            ..pop();
        }
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}

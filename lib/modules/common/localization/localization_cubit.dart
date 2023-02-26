// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hcm_ui_test/modules/common/databases/shared_preferences/shared_preferences_keys.dart';
import 'package:hive/hive.dart';

import 'index.dart';

part 'localization_cubit.freezed.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit()
      : super(LocalizationState.initial(locale: _getDefaultLocale()));

  List<Locale> get supportedLocales => LocalizationSupportedLanguage.values
      .map((e) => Locale.fromSubtags(languageCode: e.languageCode))
      .toList();

  Box? _box;
  Future<void> init() async {
    _box = await Hive.openBox('localDB');

    String? currentLanguageCode =
        await _box?.get(SharedPreferencesKeys.currentLanguageCode);

    if (currentLanguageCode == null || currentLanguageCode.isEmpty) {
      currentLanguageCode = _getDefaultLocale().languageCode;
      await _box?.put(
        SharedPreferencesKeys.currentLanguageCode,
        currentLanguageCode.toString(),
      );
    }

    emit(
      state.copyWith(
        locale: Locale.fromSubtags(languageCode: currentLanguageCode),
      ),
    );
  }

  void changeLocale(LocalizationSupportedLanguage language) {
    _box?.put(
      SharedPreferencesKeys.currentLanguageCode,
      language.languageCode,
    );

    final savedData = _box?.get(SharedPreferencesKeys.currentLanguageCode);
    print("VD DB savedData $savedData");

    emit(
      state.copyWith(
        locale: Locale.fromSubtags(languageCode: language.languageCode),
      ),
    );
  }

  void toggleLocale() {
    if (state.locale.languageCode ==
        LocalizationSupportedLanguage.vi.languageCode) {
      changeLocale(LocalizationSupportedLanguage.en);
    } else {
      changeLocale(LocalizationSupportedLanguage.vi);
    }
  }

  void notifyUpdatedLocale() {
    emit(
      state.copyWith(
        notificationUpdatedLocale: !state.notificationUpdatedLocale,
      ),
    );
  }

  static Locale _getDefaultLocale() {
    return Locale.fromSubtags(
      languageCode: LocalizationSupportedLanguage.vi.languageCode,
    );
  }
}

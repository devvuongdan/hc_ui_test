enum LocalizationSupportedLanguage {
  en,
  vi,
}

extension LocalizationSupportedLanguageValue on LocalizationSupportedLanguage {
  String get languageCode {
    switch (this) {
      case LocalizationSupportedLanguage.en:
        return "en";
      case LocalizationSupportedLanguage.vi:
        return "vi";
    }
  }
}

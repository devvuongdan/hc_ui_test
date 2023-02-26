part of 'localization_cubit.dart';

@freezed
class LocalizationState with _$LocalizationState {
  factory LocalizationState.initial({
    @Default(Locale("vi")) Locale locale,
    @Default(false) bool notificationUpdatedLocale,
  }) = _Initial;
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm_ui_test/modules/common/localization/localization_cubit.dart';

class LocalizationListenerWidget extends StatelessWidget {
  final Widget Function() builder;
  const LocalizationListenerWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      buildWhen: (previous, current) =>
          previous.notificationUpdatedLocale !=
          current.notificationUpdatedLocale,
      builder: (context, state) => builder(),
    );
  }
}

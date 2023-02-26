import 'package:flutter_modular/flutter_modular.dart';

import 'modules/common/common_module.dart';
import 'modules/common/localization/localization_cubit.dart';
import 'modules/onboarding/onboarding_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        ..._bindCommons(),
        ..._bindCommonBlocs(),
        ..._binhDatabases(),
        // ..._bindApis(),
        ..._bindRepositories(),
      ];

  List<Bind> _bindCommons() {
    return [
      Bind.singleton((i) => LocalizationCubit()..init()),
    ];
  }

  List<Bind> _binhDatabases() {
    return [];
  }

  List<Bind> _bindRepositories() {
    return [];
  }

  List<Bind> _bindCommonBlocs() {
    return [];
  }

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          ModuleName.initialRoute,
          module: CommonModule(),
          // guards: [AppGuard()],
        ),
        ModuleRoute(
          ModuleName.onboardModule,
          module: OnboardingModule(),
          // guards: [AppGuard()],
        ),
      ];
}

class ModuleName {
  ModuleName._();

  static const initialRoute = "/";
  static const onboardModule = "/onboard";
}

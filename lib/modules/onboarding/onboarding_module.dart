import 'package:flutter_modular/flutter_modular.dart';
import 'package:hcm_ui_test/modules/onboarding/containers/home/home_screen.dart';

import 'onboarding_route.dart';

class OnboardingModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          NamedOnboardingRoutes.homepage.name,
          child: (context, args) => const HomeScreen(),
        ),
      ];
}

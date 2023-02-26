import 'package:flutter_modular/flutter_modular.dart';
import 'package:hcm_ui_test/modules/onboarding/containers/home/home_screen.dart';

import 'common_route.dart';

class CommonModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          NamedCommonRoutes.home.name,
          child: (context, args) => const HomeScreen(),
        ),
      ];
}

import '../../app_module.dart';

enum NamedOnboardingRoutes {
  homepage("/home");

  final String name;
  String get path => "${ModuleName.onboardModule}$name";

  const NamedOnboardingRoutes(this.name);
}

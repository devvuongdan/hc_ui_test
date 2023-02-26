enum NamedCommonRoutes {
  //TODO: Đáng nhẽ phải là splash
  home("/");

  final String name;
  String get path => name;
  const NamedCommonRoutes(this.name);
}

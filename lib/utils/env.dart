class Env {
  static late final Flavor flavor;

  static Future<void> load() {
    flavor = Flavor.values.byName(
      const String.fromEnvironment('FLAVOR', defaultValue: 'prd'),
    );
    return Future.value();
  }
}

enum Flavor {
  dev,
  prd,
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$topPageRoute];

RouteBase get $topPageRoute => GoRouteData.$route(
  path: '/',

  factory: _$TopPageRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: '/mind-map',

      factory: _$MindMapPageRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/mind-maps',

      factory: _$MindMapListPageRoute._fromState,
    ),
  ],
);

mixin _$TopPageRoute on GoRouteData {
  static TopPageRoute _fromState(GoRouterState state) => const TopPageRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$MindMapPageRoute on GoRouteData {
  static MindMapPageRoute _fromState(GoRouterState state) =>
      MindMapPageRoute(treeId: state.uri.queryParameters['tree-id']);

  MindMapPageRoute get _self => this as MindMapPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/mind-map',
    queryParams: {if (_self.treeId != null) 'tree-id': _self.treeId},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$MindMapListPageRoute on GoRouteData {
  static MindMapListPageRoute _fromState(GoRouterState state) =>
      const MindMapListPageRoute();

  @override
  String get location => GoRouteData.$location('/mind-maps');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'77944908c5dda690741c32b702bab78d0aebafed';

/// See also [router].
@ProviderFor(router)
final routerProvider = AutoDisposeProvider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

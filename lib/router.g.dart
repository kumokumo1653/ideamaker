// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$topPageRoute, $mindMapPageRoute];

RouteBase get $topPageRoute =>
    GoRouteData.$route(path: '/', factory: _$TopPageRoute._fromState);

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

RouteBase get $mindMapPageRoute => GoRouteData.$route(
  path: '/mind_map',

  factory: _$MindMapPageRoute._fromState,
);

mixin _$MindMapPageRoute on GoRouteData {
  static MindMapPageRoute _fromState(GoRouterState state) =>
      MindMapPageRoute(treeId: state.uri.queryParameters['tree-id']);

  MindMapPageRoute get _self => this as MindMapPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/mind_map',
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

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'be805dbc3edd40b35172744fc912da3a235aab5d';

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

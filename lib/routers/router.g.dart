// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$topPageRoute, $loadingPageRoute];

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
    GoRouteData.$route(path: '/login', factory: _$LoginPageRoute._fromState),
    GoRouteData.$route(
      path: '/email-verification',

      factory: _$EmailVerificationPageRoute._fromState,
    ),
    GoRouteData.$route(path: '/my-page', factory: _$MyPageRoute._fromState),
    GoRouteData.$route(
      path: '/change-password',

      factory: _$ChangePasswordPageRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/re-authenticate',

      factory: _$ReAuthenticatePageRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/forgot-password',

      factory: _$ForgotPasswordPageRoute._fromState,
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

mixin _$LoginPageRoute on GoRouteData {
  static LoginPageRoute _fromState(GoRouterState state) =>
      const LoginPageRoute();

  @override
  String get location => GoRouteData.$location('/login');

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

mixin _$EmailVerificationPageRoute on GoRouteData {
  static EmailVerificationPageRoute _fromState(GoRouterState state) =>
      const EmailVerificationPageRoute();

  @override
  String get location => GoRouteData.$location('/email-verification');

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

mixin _$MyPageRoute on GoRouteData {
  static MyPageRoute _fromState(GoRouterState state) => const MyPageRoute();

  @override
  String get location => GoRouteData.$location('/my-page');

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

mixin _$ChangePasswordPageRoute on GoRouteData {
  static ChangePasswordPageRoute _fromState(GoRouterState state) =>
      const ChangePasswordPageRoute();

  @override
  String get location => GoRouteData.$location('/change-password');

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

mixin _$ReAuthenticatePageRoute on GoRouteData {
  static ReAuthenticatePageRoute _fromState(GoRouterState state) =>
      const ReAuthenticatePageRoute();

  @override
  String get location => GoRouteData.$location('/re-authenticate');

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

mixin _$ForgotPasswordPageRoute on GoRouteData {
  static ForgotPasswordPageRoute _fromState(GoRouterState state) =>
      const ForgotPasswordPageRoute();

  @override
  String get location => GoRouteData.$location('/forgot-password');

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

RouteBase get $loadingPageRoute => GoRouteData.$route(
  path: '/loading',

  factory: _$LoadingPageRoute._fromState,
);

mixin _$LoadingPageRoute on GoRouteData {
  static LoadingPageRoute _fromState(GoRouterState state) =>
      const LoadingPageRoute();

  @override
  String get location => GoRouteData.$location('/loading');

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

String _$routerHash() => r'9f7a57a49ab3d03ca823264ed4a2fb0c18c1b662';

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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/pages/pages.dart';
import 'package:idea_maker/features/mind_map/pages/pages.dart';
import 'package:idea_maker/features/mypage/pages/pages.dart';
import 'package:idea_maker/routers/redirect_controller.dart';
import 'package:idea_maker/routers/stream_listenable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: const TopPageRoute().location,
    refreshListenable: StreamListenable(
      ref.read(redirectControllerProvider.notifier).stream,
    ),
    routes: $appRoutes,
    redirect: (context, state) =>
        ref.read(redirectControllerProvider.notifier).redirect(context, state),
  );
}

@TypedGoRoute<TopPageRoute>(
  path: '/',
  routes: [
    TypedGoRoute<MindMapPageRoute>(path: '/mind-map'),
    TypedGoRoute<MindMapListPageRoute>(path: '/mind-maps'),
    TypedGoRoute<LoginPageRoute>(path: '/login'),
    TypedGoRoute<EmailVerificationPageRoute>(path: '/email-verification'),
    TypedGoRoute<MyPageRoute>(path: '/my-page'),
    TypedGoRoute<ChangePasswordPageRoute>(path: '/change-password'),
    TypedGoRoute<ReAuthenticatePageRoute>(path: '/re-authenticate'),
    TypedGoRoute<ForgotPasswordPageRoute>(path: '/forgot-password'),
    TypedGoRoute<ResetPasswordPageRoute>(path: '/reset-password'),
  ],
)
class TopPageRoute extends GoRouteData with _$TopPageRoute {
  const TopPageRoute({this.mode, this.oodCode});

  final String? mode;
  final String? oodCode;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TopPage();
  }
}

@TypedGoRoute<LoadingPageRoute>(path: '/loading')
class LoadingPageRoute extends GoRouteData with _$LoadingPageRoute {
  const LoadingPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoadingPage();
  }
}

class MindMapPageRoute extends GoRouteData with _$MindMapPageRoute {
  const MindMapPageRoute({this.treeId});

  @JsonKey(name: 'tree-id')
  final String? treeId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MindMapPage(treeId: treeId);
  }
}

class MindMapListPageRoute extends GoRouteData with _$MindMapListPageRoute {
  const MindMapListPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MindMapListPage();
  }
}

class LoginPageRoute extends GoRouteData with _$LoginPageRoute {
  const LoginPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

class ForgotPasswordPageRoute extends GoRouteData
    with _$ForgotPasswordPageRoute {
  const ForgotPasswordPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ForgotPasswordPage();
  }
}

class ResetPasswordPageRoute extends GoRouteData with _$ResetPasswordPageRoute {
  const ResetPasswordPageRoute({required this.oobCode});
  final String oobCode;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ResetPasswordPage(oobCode: oobCode);
  }
}

class EmailVerificationPageRoute extends GoRouteData
    with _$EmailVerificationPageRoute {
  const EmailVerificationPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EmailVerificationPage();
  }
}

class MyPageRoute extends GoRouteData with _$MyPageRoute {
  const MyPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MyPage();
  }
}

class ChangePasswordPageRoute extends GoRouteData
    with _$ChangePasswordPageRoute {
  const ChangePasswordPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChangePasswordPage();
  }
}

class ReAuthenticatePageRoute extends GoRouteData
    with _$ReAuthenticatePageRoute {
  const ReAuthenticatePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ReAuthenticatePage();
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/features/mind_map/pages/pages.dart';
import 'package:idea_maker/pages/pages.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: const TopPageRoute().location,
    routes: $appRoutes,
    redirect: (context, state) {
      final userStatusAsync = ref.watch(userStatusControllerProvider);

      if (userStatusAsync.isLoading) {
        return const LoadingPageRoute().location;
      }

      if (userStatusAsync.hasError) {
        return const TopPageRoute().location;
      }

      final userStatus = userStatusAsync.value;

      if (userStatus == null) {
        // Don't redirect if already on login or loading page
        if (state.matchedLocation == const LoadingPageRoute().location) {
          return null;
        }
        return const TopPageRoute().location;
      }

      return null;
    },
  );
}

@TypedGoRoute<TopPageRoute>(
  path: '/',
  routes: [
    TypedGoRoute<MindMapPageRoute>(path: '/mind-map'),
    TypedGoRoute<MindMapListPageRoute>(path: '/mind-maps'),
  ],
)
class TopPageRoute extends GoRouteData with _$TopPageRoute {
  const TopPageRoute();

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

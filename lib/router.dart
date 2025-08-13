import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

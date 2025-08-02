import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/features/mind_map/pages/pages.dart';
import 'package:idea_maker/pages/pages.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: $appRoutes,
  );
}

@TypedGoRoute<TopPageRoute>(path: '/')
class TopPageRoute extends GoRouteData with _$TopPageRoute {
  const TopPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TopPage();
  }
}

@TypedGoRoute<MindMapPageRoute>(path: '/mind_map')
class MindMapPageRoute extends GoRouteData with _$MindMapPageRoute {
  const MindMapPageRoute({this.treeId});

  final String? treeId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MindMapPage(treeId: treeId);
  }
}

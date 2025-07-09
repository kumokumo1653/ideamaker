import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pages/top_page.dart';

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

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useRouteObserver(
  RouteObserver routeObserver, {
  VoidCallback? onDidPush,
  VoidCallback? onDidPopNext,
  VoidCallback? onDidPop,
  VoidCallback? onDidPushNext,
}) {
  final context = useContext();
  final route = ModalRoute.of(context);
  useEffect(() {
    final routeAware = _RouteAware(
      onDidPush,
      onDidPopNext,
      onDidPop,
      onDidPushNext,
    );
    if (route is PageRoute) {
      routeObserver.subscribe(
        routeAware,
        route,
      );
    }
    return () {
      routeObserver.unsubscribe(routeAware);
    };
  }, [context, routeObserver]);
}

class _RouteAware extends RouteAware {
  _RouteAware(
    this.onDidPush,
    this.onDidPopNext,
    this.onDidPop,
    this.onDidPushNext,
  );

  final VoidCallback? onDidPush;
  final VoidCallback? onDidPopNext;
  final VoidCallback? onDidPop;
  final VoidCallback? onDidPushNext;
  @override
  void didPush() => onDidPush?.call();

  @override
  void didPopNext() => onDidPopNext?.call();

  @override
  void didPop() => onDidPop?.call();

  @override
  void didPushNext() => onDidPushNext?.call();
}

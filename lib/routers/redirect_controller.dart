import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:idea_maker/core/controllers/controllers.dart';
import 'package:idea_maker/routers/redirect_state.dart';
import 'package:idea_maker/routers/router.dart';
import 'package:idea_maker/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'redirect_controller.g.dart';

@Riverpod(keepAlive: true)
class RedirectController extends _$RedirectController {
  late final StreamController<RedirectState> _controller;

  // Stream getter
  Stream<RedirectState> get stream => _controller.stream;

  @override
  RedirectState build() {
    const initialState = RedirectState.from(
      launchStatus: AsyncValue<void>.data(null),
      userAuthenticated: false,
    );
    _controller = StreamController<RedirectState>.broadcast();
    _controller.add(initialState);

    ref.listen(userStatusControllerProvider, (previous, next) {
      final newState = RedirectState.from(
        launchStatus: const AsyncValue<void>.data(null),
        userAuthenticated: next.value != null && next.value!.emailVerified,
      );
      _controller.add(newState);
      state = newState;
    });
    return initialState;
  }

  Future<String?> redirect(GoRouterState routerState) async {
    final isGuestNavigableRoutes = [
      const TopPageRoute().location,
      const MindMapPageRoute().location,
      const LoginPageRoute().location,
      const ForgotPasswordPageRoute().location,
      const EmailVerificationPageRoute().location,
    ];

    if (state.launchStatus.isLoading) {
      return const LoadingPageRoute().location;
    }

    if (state.launchStatus.hasError) {
      return const LoginPageRoute().location;
    }
    // redirect for firebase continue url
    logger.d(routerState.matchedLocation);

    if (!state.userAuthenticated) {
      if (isGuestNavigableRoutes.contains(routerState.matchedLocation)) {
        return null;
      }
      return const TopPageRoute().location;
    }

    return null;
  }
}

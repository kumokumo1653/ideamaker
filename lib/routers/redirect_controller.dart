import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:idea_maker/core/controllers/controllers.dart';
import 'package:idea_maker/routers/redirect_state.dart';
import 'package:idea_maker/routers/router.dart';
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
      userLoggedIn: false,
      emailVerified: false,
    );
    _controller = StreamController<RedirectState>.broadcast();
    _controller.add(initialState);

    ref.listen(userStatusControllerProvider, (previous, next) {
      final newState = RedirectState.from(
        launchStatus: const AsyncValue<void>.data(null),
        userLoggedIn: next.hasValue && next.value != null,
        emailVerified: next.value?.emailVerified ?? false,
      );
      _controller.add(newState);
      state = newState;
    });
    return initialState;
  }

  Future<String?> redirect(
    BuildContext context,
    GoRouterState routerState,
  ) async {
    final isGuestNavigableRoutes = [
      const TopPageRoute().location,
      const MindMapPageRoute().location,
      const LoginPageRoute().location,
      const ForgotPasswordPageRoute().location,
      const EmailVerificationPageRoute().location,
      const ResetPasswordPageRoute(
        oobCode: '',
      ).location, // oobCode is required but we just need the base path here
    ];

    if (state.launchStatus.isLoading) {
      return const LoadingPageRoute().location;
    }

    if (state.launchStatus.hasError) {
      return const TopPageRoute().location;
    }

    if (!state.userLoggedIn) {
      if (isGuestNavigableRoutes.any(
        (target) => RegExp(target).hasMatch(routerState.matchedLocation),
      )) {
        return null;
      }
      return const TopPageRoute().location;
    } else if (!state.emailVerified) {
      if (routerState.matchedLocation ==
          const EmailVerificationPageRoute().location) {
        return null;
      }
      return const EmailVerificationPageRoute().location;
    }

    // User is logged in and email is verified
    if (routerState.matchedLocation == const LoginPageRoute().location ||
        routerState.matchedLocation ==
            const EmailVerificationPageRoute().location) {
      return const TopPageRoute().location;
    }

    return null;
  }
}

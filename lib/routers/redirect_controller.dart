import 'dart:async';

import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:idea_maker/core/controllers/controllers.dart';
import 'package:idea_maker/core/entities/firebase_mail_mode.dart';
import 'package:idea_maker/core/exceptions/exceptions.dart';
import 'package:idea_maker/core/widgets/widgets.dart';
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
    ];

    if (state.launchStatus.isLoading) {
      return const LoadingPageRoute().location;
    }

    if (state.launchStatus.hasError) {
      return const LoginPageRoute().location;
    }

    // firebase Continue url redirect handling
    final mode = FirebaseMailMode.values.firstWhereOrNull(
      (e) => e.name == Uri.base.queryParameters['mode'],
    );
    final oobCode = Uri.base.queryParameters['oobCode'];
    if (mode != null && oobCode != null) {
      return switch (mode) {
        FirebaseMailMode.verifyEmail => _handleOnVerifyEmail(context, oobCode),

        FirebaseMailMode.resetPassword => ResetPasswordPageRoute(
          oobCode: oobCode,
        ).location,
        // TODO(ohike): Handle this case.
        FirebaseMailMode.recoverEmail => throw UnimplementedError(),
      };
    }
    if (!state.userAuthenticated) {
      if (isGuestNavigableRoutes.contains(routerState.matchedLocation)) {
        return null;
      }
      return const TopPageRoute().location;
    }

    return null;
  }

  String? _handleOnVerifyEmail(BuildContext context, String oobCode) {
    try {
      FirebaseAuth.instance.applyActionCode(oobCode);
      // TODO(ohike): Show a snackbar
    } on Exception catch (e, stackTrace) {
      final exception = AuthException.getAuthException(e);
      showDialog<void>(
        context: context,
        builder: (_) => ErrorDialog(
          error: exception,
          stackTrace: stackTrace,
        ),
      );
    }
    return null;
  }
}

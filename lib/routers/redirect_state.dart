import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'redirect_state.freezed.dart';

@freezed
abstract class RedirectState with _$RedirectState {
  const factory RedirectState.from({
    required AsyncValue<void> launchStatus,
    required bool userAuthenticated,
  }) = _RedirectState;
}

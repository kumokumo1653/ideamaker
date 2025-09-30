// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redirect_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RedirectState {

 AsyncValue<void> get launchStatus; bool get userAuthenticated;
/// Create a copy of RedirectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RedirectStateCopyWith<RedirectState> get copyWith => _$RedirectStateCopyWithImpl<RedirectState>(this as RedirectState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RedirectState&&(identical(other.launchStatus, launchStatus) || other.launchStatus == launchStatus)&&(identical(other.userAuthenticated, userAuthenticated) || other.userAuthenticated == userAuthenticated));
}


@override
int get hashCode => Object.hash(runtimeType,launchStatus,userAuthenticated);

@override
String toString() {
  return 'RedirectState(launchStatus: $launchStatus, userAuthenticated: $userAuthenticated)';
}


}

/// @nodoc
abstract mixin class $RedirectStateCopyWith<$Res>  {
  factory $RedirectStateCopyWith(RedirectState value, $Res Function(RedirectState) _then) = _$RedirectStateCopyWithImpl;
@useResult
$Res call({
 AsyncValue<void> launchStatus, bool userAuthenticated
});




}
/// @nodoc
class _$RedirectStateCopyWithImpl<$Res>
    implements $RedirectStateCopyWith<$Res> {
  _$RedirectStateCopyWithImpl(this._self, this._then);

  final RedirectState _self;
  final $Res Function(RedirectState) _then;

/// Create a copy of RedirectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? launchStatus = null,Object? userAuthenticated = null,}) {
  return _then(_self.copyWith(
launchStatus: null == launchStatus ? _self.launchStatus : launchStatus // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,userAuthenticated: null == userAuthenticated ? _self.userAuthenticated : userAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _RedirectState implements RedirectState {
  const _RedirectState({required this.launchStatus, required this.userAuthenticated});
  

@override final  AsyncValue<void> launchStatus;
@override final  bool userAuthenticated;

/// Create a copy of RedirectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RedirectStateCopyWith<_RedirectState> get copyWith => __$RedirectStateCopyWithImpl<_RedirectState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RedirectState&&(identical(other.launchStatus, launchStatus) || other.launchStatus == launchStatus)&&(identical(other.userAuthenticated, userAuthenticated) || other.userAuthenticated == userAuthenticated));
}


@override
int get hashCode => Object.hash(runtimeType,launchStatus,userAuthenticated);

@override
String toString() {
  return 'RedirectState.from(launchStatus: $launchStatus, userAuthenticated: $userAuthenticated)';
}


}

/// @nodoc
abstract mixin class _$RedirectStateCopyWith<$Res> implements $RedirectStateCopyWith<$Res> {
  factory _$RedirectStateCopyWith(_RedirectState value, $Res Function(_RedirectState) _then) = __$RedirectStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncValue<void> launchStatus, bool userAuthenticated
});




}
/// @nodoc
class __$RedirectStateCopyWithImpl<$Res>
    implements _$RedirectStateCopyWith<$Res> {
  __$RedirectStateCopyWithImpl(this._self, this._then);

  final _RedirectState _self;
  final $Res Function(_RedirectState) _then;

/// Create a copy of RedirectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? launchStatus = null,Object? userAuthenticated = null,}) {
  return _then(_RedirectState(
launchStatus: null == launchStatus ? _self.launchStatus : launchStatus // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,userAuthenticated: null == userAuthenticated ? _self.userAuthenticated : userAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

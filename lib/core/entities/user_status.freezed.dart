// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserStatus {

 String get userId; String? get displayName; bool get emailVerified;
/// Create a copy of UserStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStatusCopyWith<UserStatus> get copyWith => _$UserStatusCopyWithImpl<UserStatus>(this as UserStatus, _$identity);

  /// Serializes this UserStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStatus&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,displayName,emailVerified);

@override
String toString() {
  return 'UserStatus(userId: $userId, displayName: $displayName, emailVerified: $emailVerified)';
}


}

/// @nodoc
abstract mixin class $UserStatusCopyWith<$Res>  {
  factory $UserStatusCopyWith(UserStatus value, $Res Function(UserStatus) _then) = _$UserStatusCopyWithImpl;
@useResult
$Res call({
 String userId, String? displayName, bool emailVerified
});




}
/// @nodoc
class _$UserStatusCopyWithImpl<$Res>
    implements $UserStatusCopyWith<$Res> {
  _$UserStatusCopyWithImpl(this._self, this._then);

  final UserStatus _self;
  final $Res Function(UserStatus) _then;

/// Create a copy of UserStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? displayName = freezed,Object? emailVerified = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserStatus implements UserStatus {
  const _UserStatus({required this.userId, required this.displayName, this.emailVerified = false});
  factory _UserStatus.fromJson(Map<String, dynamic> json) => _$UserStatusFromJson(json);

@override final  String userId;
@override final  String? displayName;
@override@JsonKey() final  bool emailVerified;

/// Create a copy of UserStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStatusCopyWith<_UserStatus> get copyWith => __$UserStatusCopyWithImpl<_UserStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStatus&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,displayName,emailVerified);

@override
String toString() {
  return 'UserStatus(userId: $userId, displayName: $displayName, emailVerified: $emailVerified)';
}


}

/// @nodoc
abstract mixin class _$UserStatusCopyWith<$Res> implements $UserStatusCopyWith<$Res> {
  factory _$UserStatusCopyWith(_UserStatus value, $Res Function(_UserStatus) _then) = __$UserStatusCopyWithImpl;
@override @useResult
$Res call({
 String userId, String? displayName, bool emailVerified
});




}
/// @nodoc
class __$UserStatusCopyWithImpl<$Res>
    implements _$UserStatusCopyWith<$Res> {
  __$UserStatusCopyWithImpl(this._self, this._then);

  final _UserStatus _self;
  final $Res Function(_UserStatus) _then;

/// Create a copy of UserStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? displayName = freezed,Object? emailVerified = null,}) {
  return _then(_UserStatus(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

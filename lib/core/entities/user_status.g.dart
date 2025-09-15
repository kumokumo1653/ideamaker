// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserStatus _$UserStatusFromJson(Map<String, dynamic> json) => _UserStatus(
  userId: json['user_id'] as String,
  displayName: json['display_name'] as String?,
  email: json['email'] as String?,
  emailVerified: json['email_verified'] as bool? ?? false,
);

Map<String, dynamic> _$UserStatusToJson(_UserStatus instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'display_name': instance.displayName,
      'email': instance.email,
      'email_verified': instance.emailVerified,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(id: json['id'] as int, token: json['token'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{'id': instance.id, 'token': instance.token};

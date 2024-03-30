// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpDataImpl _$$SignUpDataImplFromJson(Map<String, dynamic> json) =>
    _$SignUpDataImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      cPassword: json['c_password'] as String?,
    );

Map<String, dynamic> _$$SignUpDataImplToJson(_$SignUpDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'c_password': instance.cPassword,
    };

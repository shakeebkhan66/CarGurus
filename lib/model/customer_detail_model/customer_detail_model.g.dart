// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerDetailModelImpl _$$CustomerDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerDetailModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      nric: json['nric'] as String?,
      address: json['address'] as String?,
      dob: json['dob'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$CustomerDetailModelImplToJson(
        _$CustomerDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'nric': instance.nric,
      'address': instance.address,
      'dob': instance.dob,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaffDataModelImpl _$$StaffDataModelImplFromJson(Map<String, dynamic> json) =>
    _$StaffDataModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      nric: json['nric'] as String?,
      position: json['position'] as String?,
      salary: json['salary'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$StaffDataModelImplToJson(
        _$StaffDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'nric': instance.nric,
      'position': instance.position,
      'salary': instance.salary,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

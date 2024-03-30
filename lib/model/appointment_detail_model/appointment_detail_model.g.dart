// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentDetailModelImpl _$$AppointmentDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentDetailModelImpl(
      id: json['id'] as int?,
      appointmentDate: json['appointment_date'] as String?,
      description: json['description'] as String?,
      carId: json['car_id'] as int?,
      staffId: json['staff_id'] as int?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$AppointmentDetailModelImplToJson(
        _$AppointmentDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appointment_date': instance.appointmentDate,
      'description': instance.description,
      'car_id': instance.carId,
      'staff_id': instance.staffId,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

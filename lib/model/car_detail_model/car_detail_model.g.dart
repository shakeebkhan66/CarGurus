// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardDetailModelImpl _$$CardDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CardDetailModelImpl(
      id: json['id'] as int?,
      brand: json['brand'] as String?,
      logo: json['logo'] as String?,
      model: json['model'] as String?,
      year: json['year'] as int?,
      licensePlate: json['license_plate'] as String?,
      chassisNumber: json['chassis_number'] as String?,
      engineNumber: json['engine_number'] as String?,
      color: json['color'] as String?,
      roadTaxRenewal: json['road_tax_renewal'] as String?,
      insuranceRenewal: json['insurance_renewal'] as String?,
      customerId: json['customer_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$CardDetailModelImplToJson(
        _$CardDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'logo': instance.logo,
      'model': instance.model,
      'year': instance.year,
      'license_plate': instance.licensePlate,
      'chassis_number': instance.chassisNumber,
      'engine_number': instance.engineNumber,
      'color': instance.color,
      'road_tax_renewal': instance.roadTaxRenewal,
      'insurance_renewal': instance.insuranceRenewal,
      'customer_id': instance.customerId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

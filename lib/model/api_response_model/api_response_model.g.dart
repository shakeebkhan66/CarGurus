// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiSuccessResponseModelImpl _$$ApiSuccessResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiSuccessResponseModelImpl(
      status: json['status'] as bool?,
      resData: json['res_data'] as Map<String, dynamic>?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ApiSuccessResponseModelImplToJson(
        _$ApiSuccessResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'res_data': instance.resData,
      'message': instance.message,
    };

_$ApiValidationErrorResponseModelImpl
    _$$ApiValidationErrorResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$ApiValidationErrorResponseModelImpl(
          status: json['status'] as bool?,
          message: json['message'] as Map<String, dynamic>?,
        );

Map<String, dynamic> _$$ApiValidationErrorResponseModelImplToJson(
        _$ApiValidationErrorResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

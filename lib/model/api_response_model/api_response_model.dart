// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response_model.freezed.dart';
part 'api_response_model.g.dart';

@freezed
class ApiSuccessResponseModel with _$ApiSuccessResponseModel {
  factory ApiSuccessResponseModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "res_data") Map<String, dynamic>? resData,
    @JsonKey(name: "message") String? message,
  }) = _ApiSuccessResponseModel;

  factory ApiSuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApiSuccessResponseModelFromJson(json);
}

@freezed
class ApiValidationErrorResponseModel with _$ApiValidationErrorResponseModel {
  factory ApiValidationErrorResponseModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") Map? message,
  }) = _ApiValidationErrorResponseModel;

  factory ApiValidationErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApiValidationErrorResponseModelFromJson(json);
}

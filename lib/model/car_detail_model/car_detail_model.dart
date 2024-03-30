// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_detail_model.freezed.dart';
part 'car_detail_model.g.dart';

@freezed
class CardDetailModel with _$CardDetailModel {
  factory CardDetailModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "brand") String? brand,
    @JsonKey(name: "logo") String? logo,
    @JsonKey(name: "model") String? model,
    @JsonKey(name: "year") int? year,
    @JsonKey(name: "license_plate") String? licensePlate,
    @JsonKey(name: "chassis_number") String? chassisNumber,
    @JsonKey(name: "engine_number") String? engineNumber,
    @JsonKey(name: "color") String? color,
    @JsonKey(name: "road_tax_renewal") String? roadTaxRenewal,
    @JsonKey(name: "insurance_renewal") String? insuranceRenewal,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _CardDetailModel;

  factory CardDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CardDetailModelFromJson(json);
}

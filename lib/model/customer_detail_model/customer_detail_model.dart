// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_detail_model.freezed.dart';
part 'customer_detail_model.g.dart';

@freezed
class CustomerDetailModel with _$CustomerDetailModel {
  factory CustomerDetailModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "nric") String? nric,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "dob") String? dob,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _CustomerDetailModel;

  factory CustomerDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailModelFromJson(json);
}

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_data_model.freezed.dart';
part 'staff_data_model.g.dart';

@freezed
class StaffDataModel with _$StaffDataModel {
  factory StaffDataModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "nric") String? nric,
    @JsonKey(name: "position") String? position,
    @JsonKey(name: "salary") String? salary,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _StaffDataModel;

  factory StaffDataModel.fromJson(Map<String, dynamic> json) =>
      _$StaffDataModelFromJson(json);
}

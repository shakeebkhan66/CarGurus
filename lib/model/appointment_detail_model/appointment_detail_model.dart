// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_detail_model.freezed.dart';
part 'appointment_detail_model.g.dart';

@freezed
class AppointmentDetailModel with _$AppointmentDetailModel {
  factory AppointmentDetailModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "appointment_date") String? appointmentDate,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "car_id") int? carId,
    @JsonKey(name: "staff_id") int? staffId,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _AppointmentDetailModel;

  factory AppointmentDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDetailModelFromJson(json);
}

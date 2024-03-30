import 'package:carguru/api_service/get_list_api.dart';
import 'package:carguru/core/exception/handle_exceptions.dart';
import 'package:carguru/model/appointment_detail_model/appointment_detail_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appointment_provider.g.dart';

@riverpod
class AppointmentP extends _$AppointmentP {
  @override
  Future<List<AppointmentDetailModel?>> build() async {
    return getAppointmentList();
  }

  Future<List<AppointmentDetailModel?>> getAppointmentList() async {
    try {
      final dioProv = await ref.read(listApiProvider.future);
      final customer = await dioProv.getAppointmentList();
      if (customer != null) {
        await Future.delayed(const Duration(seconds: 1));
        return customer;
      } else {
        throw AppException(errorMessage: "User not found");
      }
    } catch (e) {
      rethrow;
    }
  }
}

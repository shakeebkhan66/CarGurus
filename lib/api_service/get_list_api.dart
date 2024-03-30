import 'package:carguru/core/exception/handle_exceptions.dart';
import 'package:carguru/model/appointment_detail_model/appointment_detail_model.dart';
import 'package:carguru/model/car_detail_model/car_detail_model.dart';
import 'package:carguru/network/dio_provider.dart';
import 'package:carguru/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_list_api.g.dart';

class ListApi {
  ListApi({required this.dio});

  final Dio dio;

  Future<List<CardDetailModel>?> getCarList() async {
    try {
      final response = await dio.get("get-car-list");

      final resData = response.data;

      if (response.data == null) {
        return Future.error(AppException(errorMessage: "No record found"));
      }

      if ((resData is Map) == false) {
        return Future.error(
          AppException(errorMessage: "invalid response type"),
        );
      }
      if (resData['status'] == false) {
        return Future.error(
          AppException(errorMessage: "invalid response type"),
        );
      }

      final result = resData['data'];

      if (result is List && result.isNotEmpty) {
        return result.map((e) => CardDetailModel.fromJson(e)).toList();
      }
      return null;
    } on DioException catch (e) {
      final errorMessage = NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e));

      return Future.error(AppException(errorMessage: errorMessage));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<AppointmentDetailModel>?> getAppointmentList() async {
    try {
      final response = await dio.get("get-appointment-list");

      final resData = response.data;

      if (response.data == null) {
        return Future.error(AppException(errorMessage: "No record found"));
      }

      if ((resData is Map) == false) {
        return Future.error(
          AppException(errorMessage: "invalid response type"),
        );
      }
      if (resData['status'] == false) {
        return Future.error(
          AppException(errorMessage: "invalid response type"),
        );
      }

      final result = resData['data'];

      if (result is List && result.isNotEmpty) {
        return result.map((e) => AppointmentDetailModel.fromJson(e)).toList();
      }
      return null;
    } on DioException catch (e) {
      final errorMessage = NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e));

      return Future.error(AppException(errorMessage: errorMessage));
    } catch (e, stacktrace) {
      return Future.error(e);
    }
  }
}

@riverpod
Future<ListApi> listApi(ListApiRef ref) async {
  final dioProv = await ref.read(dioProvider.future);
  return ListApi(dio: dioProv);
}

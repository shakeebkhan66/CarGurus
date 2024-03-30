import 'package:carguru/api_service/get_list_api.dart';
import 'package:carguru/core/exception/handle_exceptions.dart';
import 'package:carguru/model/car_detail_model/car_detail_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'car_provider.g.dart';

@riverpod
class AvailableCarP extends _$AvailableCarP {
  @override
  Future<List<CardDetailModel?>> build() async {
    return getCarList();
  }

  Future<List<CardDetailModel?>> getCarList() async {
    try {
      final dioProv = await ref.read(listApiProvider.future);
      final customer = await dioProv.getCarList();
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

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/model/geofence/geofence_model.dart';
import 'package:trackingapp/bussiness_logic/services/geofence/geofence_repository.dart';

class GeofenceController extends GetxController {
  final Rxn<GeofenceModel> listGeofence = Rxn<GeofenceModel>();
  var isLoading = false.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  Dio dio = Dio();

  @override
  void onInit() {
    geofenceList();
    super.onInit();
  }

  Future geofenceList() async {
    isLoading(false);
    try {
      isLoading(true);
      final result = await GeofenceApi().getGeofenceList();
      isLoading(false);
      isError(false);
      listGeofence.value = result;
      return listGeofence;
    } catch (e) {
      isLoading(false);
      throw Exception(e);
    }
  }
}

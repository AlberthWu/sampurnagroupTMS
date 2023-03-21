import 'package:dio/dio.dart';
import 'package:trackingapp/bussiness_logic/model/geofence/geofence_model.dart';

class GeofenceApi {
  final String url = 'https://telematics.transtrack.id/api/';

  Future getGeofenceList() async {
    try {
      final response = await Dio(BaseOptions(baseUrl: url)).get(
          '/get_geofences?lang=en&user_api_hash=\$2y\$10\$FAIEorvAA7Z7V/pDrVON7.w7LMRfcNak/SjyfvtEnhptKcXM3IgMy');
      // print(response);
      return GeofenceModel.fromJSON(response.data);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}

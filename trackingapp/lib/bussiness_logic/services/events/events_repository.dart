import 'package:dio/dio.dart';
import 'package:trackingapp/bussiness_logic/model/events/events_model.dart';

class EventsApi {
  final String dateTime = '${DateTime.now().toString().replaceAll(' ', 'T')}Z';
  final String url = 'https://telematics.transtrack.id/api/get_events';
  // final String path = '?device_id=8322&date_from=1995-07-22T19:58:17.713Z&date_to=$dateTime&lang=en&user_api_hash=\$2y\$10\$FAIEorvAA7Z7V/pDrVON7.w7LMRfcNak/SjyfvtEnhptKcXM3IgMy';

  Future getEventsData(int id) async {
    try {
      final response = await Dio(BaseOptions(baseUrl: url)).get(
          '?device_id=$id&date_from=1995-07-22T19:58:17.713Z&date_to=$dateTime&lang=en&user_api_hash=\$2y\$10\$FAIEorvAA7Z7V/pDrVON7.w7LMRfcNak/SjyfvtEnhptKcXM3IgMy');
      // print(response);
      return EventsModel.fromJSON(response.data);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}

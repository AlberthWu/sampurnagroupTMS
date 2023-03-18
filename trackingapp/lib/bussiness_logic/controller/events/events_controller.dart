import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/model/events/events_model.dart';
import 'package:trackingapp/bussiness_logic/services/events/events_repository.dart';

class EventsController extends GetxController {
  final RxList<EventsModel> listEvents = RxList();
  var isLoading = false.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  Dio dio = Dio();

  Future eventsList(int id) async {
    printError();
    isLoading(false);
    try {
      isLoading(true);
      final result = await EventsApi().getEventsData(id);
      // printError();
      // print(result);
      isLoading(false);
      isError(false);
      listEvents.value = result;
      return listEvents;
    } catch (e) {
      isLoading(false);
      throw Exception(e);
    }
  }
}

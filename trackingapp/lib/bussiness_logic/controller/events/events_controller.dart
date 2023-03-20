import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/model/events/events_model.dart';
import 'package:trackingapp/bussiness_logic/services/events/events_repository.dart';

class EventsController extends GetxController {
  final Rxn<EventsModel> listEvents = Rxn<EventsModel>();
  // final listEvents = RxList<EventsModel>();
  var isLoading = false.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  Dio dio = Dio();

  @override
  void onInit() {
    // int id = 0;
    // eventsList(id);
    super.onInit();
  }

  Future eventsList(int id) async {
    // printError();
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

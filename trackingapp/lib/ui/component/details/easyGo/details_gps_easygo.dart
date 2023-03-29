import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';
import 'package:trackingapp/utils/style.dart';

class DetailsGPSMapEasygo extends StatelessWidget {
  const DetailsGPSMapEasygo(this.data, {super.key});
  final Data data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyStyle.secondaryColor,
      height: Get.height * 0.5,
      width: Get.width,
      child: GoogleMap(
        gestureRecognizers: Set()
          ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
          ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
          ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
          ..add(Factory<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer())),
        initialCameraPosition:
            CameraPosition(target: LatLng(data.lat, data.lon), zoom: 15),
        markers: {
          Marker(
              markerId: MarkerId(data.nopol.toString() + 'details'),
              position: LatLng(data.lat, data.lon))
        },
      ),
    );
  }
}

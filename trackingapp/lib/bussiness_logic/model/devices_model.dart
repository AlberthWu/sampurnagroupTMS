import 'package:trackingapp/utils/utils.dart';

class ItemsModel {
  late int id, alarm, course, speed, altitude, stopDurationSec, movedTimestamp;
  late String name,
      online,
      time,
      iconType,
      iconColor,
      power,
      address,
      protocol,
      driver,
      distanceUnitHour,
      unitOfDistance,
      unitOfAlititude,
      unitofCapacity,
      stopDuration,
      detectEngine,
      engineHours;
  late double lat, lng, totalDistance;
  late IconColors iconColors;
  late Icons icon;
  late DriverData driverData;
  late List<Sensors> sensors;
  late List<Tail> tail;

  ItemsModel(
      this.id,
      this.alarm,
      this.course,
      this.speed,
      this.altitude,
      this.stopDurationSec,
      this.movedTimestamp,
      this.name,
      this.online,
      this.time,
      this.iconType,
      this.iconColor,
      this.power,
      this.address,
      this.protocol,
      this.driver,
      this.distanceUnitHour,
      this.unitOfAlititude,
      this.unitOfDistance,
      this.unitofCapacity,
      this.stopDuration,
      this.detectEngine,
      this.engineHours,
      this.lat,
      this.lng,
      this.totalDistance,
      this.iconColors,
      this.icon,
      this.driverData,
      this.sensors,
      this.tail);

  ItemsModel.fromJSON(JSON json) {
    id = json['id'];
    alarm = json['alarm'];
    course = json['course'];
    speed = json['speed'];
    stopDurationSec = json['stop_duration_sec'];
    movedTimestamp = json['moved_timestamp'];
    name = json['name'];
    online = json['online'];
    time = json['time'];
    iconType = json['icon_type'];
    iconColor = json['icon_color'];
    power = json['power'];
    address = json['address'];
    protocol = json['protocol'];
    driver = json['driver'];
    distanceUnitHour = json['distance_unit_hour'];
    unitOfDistance = json['unit_of_distance'];
    unitOfAlititude = json['unit_of_altitude'];
    unitofCapacity = json['unit_of_capacity'];
    stopDuration = json['stop_duration'];
    detectEngine = json['detect_engine'];
    engineHours = json['engine_hours'];
    lat = json['lat'];
    lng = json['lng'];
    totalDistance = json['total_distance'];
    iconColors = IconColors.fromJSON(json['icon_colors']);
    icon = Icons.fromJSON(json['icon']);
    driverData = DriverData.fromJSON(json['driver_data']);
    sensors = json['sensors'] == null
        ? []
        : (json['sensors'] as List).map((e) => Sensors.fromJSON(e)).toList();
    tail = json['tail'] == null
        ? []
        : (json['tail'] as List).map((e) => Tail.fromJSON(e)).toList();
  }
}

class IconColors {
  late String moving, stopped, offline, engine;

  IconColors(this.moving, this.stopped, this.offline, this.engine);

  IconColors.fromJSON(JSON json) {
    moving = json['moving'];
    stopped = json['stopped'];
    offline = json['offline'];
    engine = json['engine'];
  }

  JSON get toJSON => {
        'moving': moving,
        'stopped': stopped,
        'offline': offline,
        'engine': engine
      };
}

class Icons {
  late int id, userId, order, width, heigth, byStatus;
  late String type, path;

  Icons(this.id, this.userId, this.order, this.width, this.heigth,
      this.byStatus, this.type, this.path);

  Icons.fromJSON(JSON json) {
    id = json['id'];
    userId = json['user_id'];
    order = json['order'];
    width = json['width'];
    heigth = json['height'];
    byStatus = json['by_Status'];
    type = json['type'];
    path = json['path'];
  }

  JSON get toJSON => {
        'id': id,
        'user_id': userId,
        'order': order,
        'width': width,
        'height': heigth,
        'by_status': byStatus,
        'type': type,
        'path': path
      };
}

class DriverData {
  late int? id, userId, deviceId;
  late String? name, rfid, phone, email, description, createdAt, updatedAt;

  DriverData(this.id, this.userId, this.deviceId, this.name, this.rfid,
      this.phone, this.email, this.description, this.createdAt, this.updatedAt);

  DriverData.fromJSON(JSON json) {
    id = json['id'];
    userId = json['user_id'];
    deviceId = json['device_id'];
    name = json['name'];
    rfid = json['rfid'];
    phone = json['phone'];
    email = json['email'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  JSON get toJSON => {
        'id': id,
        'user_id': userId,
        'device_id': deviceId,
        'name': name,
        'rfid': rfid,
        'phone': phone,
        'email': email,
        'description': description,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}

class Sensors {
  late int id, showInPopup, scaleValue;
  late String type, name, value;
  late bool val;

  Sensors(this.id, this.showInPopup, this.scaleValue, this.type, this.name,
      this.value, this.val);

  Sensors.fromJSON(JSON json) {
    id = json['id'];
    showInPopup = json['show_in_popup'];
    scaleValue = json['scale_value'];
    type = json['type'];
    name = json['name'];
    value = json['value'];
    val = json['val'];
  }

  JSON get toJSON => {
        'id': id,
        'show_in_popup': showInPopup,
        'scale_value': scaleValue,
        'type': type,
        'name': name,
        'value': value,
        'val': val
      };
}

class Tail {
  late bool lat, lng;

  Tail(this.lat, this.lng);

  Tail.fromJSON(JSON json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  JSON get toJSON => {'lat': lat, 'lng': lng};
}

// class DeviceData {
//   late int id, userId, currentDriverId, traccarDeviceId, iconId, active, deleted, fuelMeasurementId, tailLength, minMovingSpeed, minFuelFillings, minFuelThefts, snapToRoad, gprsTemplates
// }
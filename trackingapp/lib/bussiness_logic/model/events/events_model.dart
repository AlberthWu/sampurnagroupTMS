import 'package:trackingapp/utils/utils.dart';

class DataEvents {
  late int id,
      userId,
      deviceId,
      geofenceId,
      poiId,
      positionId,
      altitude,
      course,
      speed,
      deleted;
  late String type,
      message,
      address,
      time,
      createdAt,
      updatedAt,
      name,
      detail,
      deviceName;
  late bool latitude, longitude;
  late GeofenceEvent geofenceEvent;
  late AdditionalEvent additionalEvent;

  DataEvents(
      this.id,
      this.additionalEvent,
      this.address,
      this.altitude,
      this.course,
      this.createdAt,
      this.deleted,
      this.detail,
      this.deviceId,
      this.deviceName,
      this.geofenceEvent,
      this.geofenceId,
      this.latitude,
      this.longitude,
      this.message,
      this.name,
      this.poiId,
      this.positionId,
      this.speed,
      this.time,
      this.type,
      this.updatedAt,
      this.userId);

  DataEvents.fromJSON(JSON json) {
    id = json['id'];
    additionalEvent = json['additional'];
    address = json['address'];
    altitude = json['altitude'];
    course = json['course'];
    createdAt = json['created_at'];
    deleted = json['deleted'];
    detail = json['detail'];
    deviceId = json['device_id'];
    deviceName = json['device_name'];
    geofenceEvent = json['geofence'];
    geofenceId = json['geofence_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    message = json['message'];
    name = json['name'];
    poiId = json['poi_id'];
    positionId = json['position_id'];
    speed = json['speed'];
    time = json['time'];
    type = json['type'];
    updatedAt = json['update_at'];
    userId = json['user_id'];
  }

  JSON get toJSON => {
        'id': id,
        'additio': additionalEvent,
        '': address,
        '': altitude,
        '': course,
        '': createdAt,
        '': deleted,
        '': detail,
        '': deviceId,
        '': deviceName,
        '': geofenceEvent,
        '': geofenceId,
        '': latitude,
        '': longitude,
        '': message,
        '': name,
        '': poiId,
        '': positionId,
        '': speed,
        '': time,
        '': type,
        '': updatedAt,
        '': userId,
      };
}

class GeofenceEvent {
  late int id;
  late String name;

  GeofenceEvent(this.id, this.name);

  GeofenceEvent.fromJSON(JSON json) {
    id = json['id'];
    name = json['name'];
  }

  JSON get toJSON => {
        'id': id,
        'name': name,
      };
}

class AdditionalEvent {
  late String geofence;

  AdditionalEvent(this.geofence);

  AdditionalEvent.fromJSON(JSON json) {
    geofence = json['geofence'];
  }

  JSON get toJSON => {'geofence': geofence};
}

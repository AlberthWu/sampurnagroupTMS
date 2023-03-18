import 'package:trackingapp/utils/utils.dart';

class EventsModel {
  late int status;
  late ItemEvents itemEvents;

  EventsModel(this.status, this.itemEvents);

  EventsModel.fromJSON(JSON json) {
    status = json['status'];
    itemEvents = ItemEvents.fromJSON(json['items']);
  }

  JSON get toJSON => {'status': status, 'items': itemEvents};
}

class ItemEvents {
  late int total;
  late List<DataEvents> dataEvents;

  ItemEvents(this.dataEvents, this.total);

  ItemEvents.fromJSON(JSON json) {
    total = json['total'];
    dataEvents = json['data'] == null
        ? []
        : (json['data'] as List).map((e) => DataEvents.fromJSON(e)).toList();
  }

  JSON get toJSON => {
        'total': total,
        'data': dataEvents,
      };
}

class DataEvents {
  late int? id,
      userId,
      deviceId,
      geofenceId,
      poiId,
      positionId,
      altitude,
      course,
      speed,
      deleted;
  late String? type,
      message,
      address,
      time,
      createdAt,
      updatedAt,
      name,
      detail,
      deviceName;
  late double? latitude, longitude;
  late GeofenceEvent? geofenceEvent;
  late AdditionalEvent? additionalEvent;

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
      // this.geofenceEvent,
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
    additionalEvent = json['additional'] == null
        ? null
        : AdditionalEvent.fromJSON(json['additional']);
    address = json['address'];
    altitude = json['altitude'];
    course = json['course'];
    createdAt = json['created_at'];
    deleted = json['deleted'];
    detail = json['detail'];
    deviceId = json['device_id'];
    deviceName = json['device_name'];
    // geofenceEvent =
    //     json['geofence'] ? null : GeofenceEvent.fromJSON(json['geofence']);
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
        'additional': additionalEvent,
        'address': address,
        'altitude': altitude,
        'course': course,
        'created_at': createdAt,
        'deleted': deleted,
        'detail': detail,
        'device_id': deviceId,
        'device_name': deviceName,
        'geofence': geofenceEvent,
        'geofence_id': geofenceId,
        'latitude': latitude,
        'longitude': longitude,
        'message': message,
        'name': name,
        'poi_id': poiId,
        'position_id': positionId,
        'speed': speed,
        'time': time,
        'type': type,
        'updated_at': updatedAt,
        'user_id': userId,
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

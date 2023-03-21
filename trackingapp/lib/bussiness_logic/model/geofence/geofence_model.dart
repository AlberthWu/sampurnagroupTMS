import 'package:trackingapp/utils/utils.dart';

class GeofenceModel {
  late GeofencesItems? geofencesItems;
  late int status;

  GeofenceModel(this.geofencesItems, this.status);

  GeofenceModel.fromJSON(JSON json) {
    geofencesItems = GeofencesItems.fromJSON(json['items']);
    status = json['status'];
  }

  JSON get toJSON => {'items': geofencesItems, 'status': status};
}

class GeofencesItems {
  late List<Geofences> geofences;

  GeofencesItems(this.geofences);

  GeofencesItems.fromJSON(JSON json) {
    geofences = json['geofences'] == null
        ? []
        : (json['geofences'] as List)
            .map((e) => Geofences.fromJSON(e))
            .toList();
  }

  JSON get toJSON => {'geofences': geofences};
}

class Geofences {
  late int? id, userId, groupId, active, speedLimit;
  late String? name, coordinates, polygonColor, createdAt, updatedAt, type;
  late double? radius;
  late CenterGeofences? centerGeofences;

  Geofences(
      this.active,
      this.centerGeofences,
      this.coordinates,
      this.createdAt,
      this.groupId,
      this.id,
      this.name,
      this.polygonColor,
      this.radius,
      this.speedLimit,
      this.type,
      this.updatedAt,
      this.userId);

  Geofences.fromJSON(JSON json) {
    active = json['active'];
    centerGeofences = json['center'] == null
        ? null
        : CenterGeofences.fromJSON(json['center']);
    coordinates = json['coordinates'];
    createdAt = json['created_at'];
    groupId = json['group_id'];
    id = json['id'];
    name = json['name'];
    polygonColor = json['polygon_color'];
    radius = json['radius'];
    speedLimit = json['speed_limit'];
    type = json['type'];
    updatedAt = json['update_at'];
    userId = json['user_id'];
  }
}

class CenterGeofences {
  late double lat, lng;

  CenterGeofences(this.lat, this.lng);

  CenterGeofences.fromJSON(JSON json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  JSON get toJSON => {'lat': lat, 'lng': lng};
}

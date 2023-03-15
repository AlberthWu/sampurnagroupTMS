import 'dart:convert';

import 'package:trackingapp/utils/utils.dart';

class LoginModel {
  late int? status;
  late String? jwt;

  LoginModel({this.status, this.jwt});

  LoginModel.fromJSON(JSON json) {
    status = json['status'];
    jwt = json['user_api_hash'];
  }

  JSON get toJSON => {'status': status, 'user_api_hash': jwt};
}

class Permissions {}

class DevicesPermission {
  late bool view, edit, remove;

  DevicesPermission(this.view, this.edit, this.remove);

  DevicesPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class AlertsPermission {
  late bool view, edit, remove;

  AlertsPermission(this.view, this.edit, this.remove);

  AlertsPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class GeofencesPermission {
  late bool view, edit, remove;

  GeofencesPermission(this.view, this.edit, this.remove);

  GeofencesPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class RoutesPermission {
  late bool view, edit, remove;

  RoutesPermission(this.view, this.edit, this.remove);

  RoutesPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class PoiPermission {
  late bool view, edit, remove;

  PoiPermission(this.view, this.edit, this.remove);

  PoiPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class ReportsPermission {
  late bool view, edit, remove;

  ReportsPermission(this.view, this.edit, this.remove);

  ReportsPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class DriversPermission {
  late bool view, edit, remove;

  DriversPermission(this.view, this.edit, this.remove);

  DriversPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class CustomEventsPermission {
  late bool view, edit, remove;

  CustomEventsPermission(this.view, this.edit, this.remove);

  CustomEventsPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class UserGprsTemplatesPermission {
  late bool view, edit, remove;

  UserGprsTemplatesPermission(this.view, this.edit, this.remove);

  UserGprsTemplatesPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class UserSmsTemplatesPermission {
  late bool view, edit, remove;

  UserSmsTemplatesPermission(this.view, this.edit, this.remove);

  UserSmsTemplatesPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class SmsGatewaysPermission {
  late bool view, edit, remove;

  SmsGatewaysPermission(this.view, this.edit, this.remove);

  SmsGatewaysPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class SendCommandsPermission {
  late bool view, edit, remove;

  SendCommandsPermission(this.view, this.edit, this.remove);

  SendCommandsPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class HistoryPermission {
  late bool view, edit, remove;

  HistoryPermission(this.view, this.edit, this.remove);

  HistoryPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class MaintenancePermission {
  late bool view, edit, remove;

  MaintenancePermission(this.view, this.edit, this.remove);

  MaintenancePermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class CameraPermission {
  late bool view, edit, remove;

  CameraPermission(this.view, this.edit, this.remove);

  CameraPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

class DeviceCameraPermission {
  late bool view, edit, remove;

  DeviceCameraPermission(this.view, this.edit, this.remove);

  DeviceCameraPermission.fromJSON(JSON json) {
    view = json['view'];
    edit = json['edit'];
    remove = json['remove'];
  }

  JSON get toJSON => {'view': view, 'edit': edit, 'remove': remove};
}

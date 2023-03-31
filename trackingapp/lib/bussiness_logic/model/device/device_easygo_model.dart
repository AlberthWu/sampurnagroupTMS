import 'package:get/get.dart';
import 'package:trackingapp/utils/utils.dart';

class LastPositionModel {
  late int responseCode;
  late String responseMessage;
  late List<Data> data;

  LastPositionModel(this.responseCode, this.responseMessage, this.data);

  LastPositionModel.fromJSON(JSON json) {
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
    data = (json['Data'] as List).map((e) => Data.fromJSON(e)).toList();
  }
}

class Data {
  late int altitude, gpsSatelit, gsmSignal, sos, acc, isAlarm;
  late String? gsmNo,
      noAsset,
      groupNm,
      companyNm,
      carType,
      carModel,
      addr,
      kodePos,
      provinsi,
      kota,
      kec,
      alarmNm,
      reportNm,
      direction,
      driverNm,
      gpsSn,
      gpsTime,
      sTime;
  late String nopol;
  late double lat, lon, odometer, speed, bateryPercent, mainPowerVoltage;
  late CurrentGeoLocationStatus? currentGeoLocationStatus;
  late TotalKM totalkmYtd, totalkmMtd;
  late CurrentUtilisasiStatus? currentUtilisasiStatus;
  late TotalkmToday totalkmToday;
  late CurrentStatusVehicle? currentStatusVehicle;
  late RxBool selected;

  Data(
      this.altitude,
      this.gpsSatelit,
      this.gsmSignal,
      this.sos,
      this.acc,
      this.isAlarm,
      this.gsmNo,
      this.noAsset,
      this.groupNm,
      this.nopol,
      this.companyNm,
      this.carType,
      this.carModel,
      this.addr,
      this.kodePos,
      this.provinsi,
      this.kota,
      this.kec,
      this.alarmNm,
      this.reportNm,
      this.direction,
      this.driverNm,
      this.gpsSn,
      this.gpsTime,
      this.sTime,
      this.lat,
      this.lon,
      this.odometer,
      this.speed,
      this.bateryPercent,
      this.mainPowerVoltage,
      this.currentGeoLocationStatus,
      this.currentStatusVehicle,
      this.currentUtilisasiStatus,
      this.totalkmMtd,
      this.totalkmToday,
      this.totalkmYtd,
      this.selected);

  Data.fromJSON(JSON json) {
    altitude = json['altitude'];
    gpsSatelit = json['gps_satelit'];
    gsmSignal = json['gsm_signal'];
    sos = json['sos'];
    acc = json['acc'];
    isAlarm = json['is_alarm'];
    gsmNo = json['gsm_no'];
    noAsset = json['no_asset'];
    groupNm = json['group_nm'];
    nopol = json['nopol'];
    companyNm = json['company_nm'];
    carType = json['car_type'];
    carModel = json['car_model'];
    addr = json['addr'];
    kodePos = json['kode_pos'];
    provinsi = json['provinsi'];
    kota = json['kota'];
    kec = json['kec'];
    alarmNm = json['alarm_nm'];
    reportNm = json['report_nm'];
    direction = json['direction'];
    driverNm = json['driver_nm'];
    gpsSn = json['gps_sn'];
    gpsTime = json['gps_time'];
    sTime = json['stime'];
    lat = json['lat'];
    lon = json['lon'];
    odometer = json['odometer'];
    speed = json['speed'];
    bateryPercent = json['battery_percent'];
    mainPowerVoltage = json['main_power_voltage'];
    currentGeoLocationStatus = json['currentGeoLocationStatus'] == null
        ? null
        : CurrentGeoLocationStatus.fromJSON(json['currentGeoLocationStatus']);
    currentStatusVehicle =
        CurrentStatusVehicle.fromJSON(json['currentStatusVehicle']);
    currentUtilisasiStatus = json['currentUtilitasStatus'] == null
        ? null
        : CurrentUtilisasiStatus.fromJSON(json['currentUtilitasStatus']);
    totalkmMtd = TotalKM.fromJSON(json['totalkm_mtd']);
    totalkmToday = TotalkmToday.fromJSON(json['totalkm_today']);
    totalkmYtd = TotalKM.fromJSON(json['totalkm_ytd']);
    selected = false.obs;
  }
}

class CurrentDO {
  late int doId,
      statusDo,
      opsiComplete,
      isAlarm,
      durValidTujuan,
      companyId,
      useridMonitor,
      maxTimeChecking,
      versiDo,
      skipAsalDOId;
  late String companyNm,
      note,
      flag,
      gpsSn,
      snEseal,
      ketStatusDo,
      ketOpsiComplete,
      tglDo,
      tglInput,
      tglBl,
      tglLockAsal,
      tglUnlockTujuan,
      tglBalikAsal,
      tglClosed,
      tglPod,
      noSj,
      noDo,
      transportir,
      driverNm,
      alertTelegram,
      alertEmail;
  late double maxTimeDelivery;
  late bool bCheckDoneHistData;
  late List<Asal> asal;
  late List<Tujuan> tujuan;
  late List<Alert> alert;
  late List<Alarm> alarm;
  late InfoAsaldanTujuan infoTujuanAsal, infoAsalComplete;
  late SafetyInfo safetyInfo;

  CurrentDO(
    this.doId,
    this.statusDo,
    this.opsiComplete,
    this.isAlarm,
    this.durValidTujuan,
    this.companyId,
    this.useridMonitor,
    this.maxTimeChecking,
    this.versiDo,
    this.skipAsalDOId,
    this.companyNm,
    this.note,
    this.flag,
    this.gpsSn,
    this.snEseal,
    this.ketStatusDo,
    this.ketOpsiComplete,
    this.tglDo,
    this.tglInput,
    this.tglBl,
    this.tglLockAsal,
    this.tglUnlockTujuan,
    this.tglBalikAsal,
    this.tglClosed,
    this.tglPod,
    this.noSj,
    this.noDo,
    this.transportir,
    this.driverNm,
    this.alertTelegram,
    this.alertEmail,
    this.maxTimeDelivery,
    this.bCheckDoneHistData,
    this.alarm,
    this.alert,
    this.asal,
    this.infoTujuanAsal,
    this.infoAsalComplete,
    this.safetyInfo,
    this.tujuan,
  );

  CurrentDO.fromJSON(JSON json) {
    doId = json['do_id'];
    statusDo = json['status_do'];
    opsiComplete = json['opsi_complete'];
    isAlarm = json['is_alarm'];
    durValidTujuan = json['dur_valid_tujuan'];
    companyId = json['company_id'];
    useridMonitor = json['userid_monitor'];
    maxTimeChecking = json['max_time_checking'];
    versiDo = json['versi_do'];
    skipAsalDOId = json['skipAsal_DOId'];
    companyNm = json['company_nm'];
    note = json['note'];
    flag = json['flag'];
    gpsSn = json['gps_sn'];
    snEseal = json['sn_eseal'];
    ketStatusDo = json['ket_status_do'];
    ketOpsiComplete = json['ket_opsi_complete'];
    tglDo = json['tgl_do'];
    tglInput = json['tgl_input'];
    tglBl = json['tgl_bl'];
    tglLockAsal = json['tgl_lock_asal'];
    tglUnlockTujuan = json['tgl_unlock_tujuan'];
    tglBalikAsal = json['tgl_balik_asal'];
    tglClosed = json['tgl_closed'];
    tglPod = json['tgl_pod'];
    noSj = json['no_sj'];
    noDo = json['no_do'];
    transportir = json['transportir'];
    driverNm = json['driver_nm'];
    alertTelegram = json['alert_telegram'];
    alertEmail = json['alert_email'];
    maxTimeDelivery = json['max_time_delivery'];
    bCheckDoneHistData = json['bCheckDoneHistData'];
    alarm = json['alarm'] == null
        ? []
        : (json['alarm'] as List).map((e) => Alarm.fromJSON(e)).toList();
    alert = json['alert'] == null
        ? []
        : (json['alert'] as List).map((e) => Alert.fromJSON(e)).toList();
    asal = json['asal'] == null
        ? []
        : (json['asal'] as List).map((e) => Asal.fromJSON(e)).toList();
    infoTujuanAsal = InfoAsaldanTujuan.fromJSON(json['info_tujuan_asal']);
    infoAsalComplete = InfoAsaldanTujuan.fromJSON(json['info_asal_complete']);
    safetyInfo = SafetyInfo.fromJSON(json['safety_info']);
    tujuan = json['tujuan'] == null
        ? []
        : (json['tujuan'] as List).map((e) => Tujuan.fromJSON(e)).toList();
  }
}

class Asal {
  late int geoId, dosId, stopNum;
  late String geoNm,
      geoCode,
      geoCategory,
      tglMasuk,
      tglKeluar,
      tglUnlock,
      tglLock,
      planLoadingTime;
  late bool complete, validIN, alarmOverStay;
  late double lat, lon, radius;
  late Duration duration;

  Asal(
    this.alarmOverStay,
    this.complete,
    this.dosId,
    this.duration,
    this.geoCategory,
    this.geoCode,
    this.geoId,
    this.geoNm,
    this.lat,
    this.lon,
    this.planLoadingTime,
    this.radius,
    this.stopNum,
    this.tglKeluar,
    this.tglLock,
    this.tglMasuk,
    this.tglUnlock,
    this.validIN,
  );

  Asal.fromJSON(JSON json) {
    alarmOverStay = json['alarmOverStay'];
    complete = json['Complete'];
    dosId = json['dos_id'];
    duration = Duration.fromJSON(json['duration']);
    geoCategory = json['geo_category'];
    geoCode = json['geo_code'];
    geoId = json['geo_id'];
    geoNm = json['geo_nm'];
    lat = json['lat'];
    lon = json['lon'];
    planLoadingTime = json['plan_loading_time'];
    radius = json['radius'];
    stopNum = json['stop_num'];
    tglKeluar = json['tgl_keluar'];
    tglLock = json['tgl_lock'];
    tglMasuk = json['tgl_masuk'];
    tglUnlock = json['tgk_unlock'];
    validIN = json['validIN'];
  }
}

class Tujuan {
  late int geoId, dosId, stopNum;
  late String geoNm,
      geoCode,
      geoType,
      noSj,
      tglMasuk,
      tglKeluar,
      tglLock,
      tglUnlock,
      startBongkar,
      selesaiBongkar,
      planUnholdingTime,
      desc,
      custTelegram,
      custEmail;
  late bool complete, alarmOverStay;
  late double lon, lat, radius;
  late Duration duration;
  late ETA? eta;
  late InfoFromPrev infoFromPrev;

  Tujuan(
    this.alarmOverStay,
    this.complete,
    this.custEmail,
    this.custTelegram,
    this.desc,
    this.dosId,
    this.duration,
    this.eta,
    this.geoCode,
    this.geoId,
    this.geoNm,
    this.geoType,
    this.infoFromPrev,
    this.lat,
    this.lon,
    this.noSj,
    this.planUnholdingTime,
    this.radius,
    this.selesaiBongkar,
    this.startBongkar,
    this.stopNum,
    this.tglKeluar,
    this.tglLock,
    this.tglUnlock,
    this.tglMasuk,
  );

  Tujuan.fromJSON(JSON json) {
    alarmOverStay = json['alarmOverStay'];
    complete = json['Complete'];
    custEmail = json['cust_email'];
    custTelegram = json['cust_telegram'];
    desc = json['desc'];
    dosId = json['dos_id'];
    duration = Duration.fromJSON(json['duration']);
    eta = json['ETA'] == null ? null : ETA.fromJSON(json['ETA']);
    geoCode = json['geo_code'];
    geoId = json['geo_id'];
    geoNm = json['geo_nm'];
    geoType = json['geo_type'];
    infoFromPrev = InfoFromPrev.fromJSON(json['info_from_prev']);
    lat = json['lat'];
    lon = json['lon'];
    noSj = json['no_sj'];
    planUnholdingTime = json['plan_unholding_time'];
    radius = json['radius'];
    selesaiBongkar = json['selesai_bongkar'];
    startBongkar = json['start_bongkar'];
    stopNum = json['stop_num'];
    tglKeluar = json['tgl_keluar'];
    tglLock = json['tgl_lock'];
    tglUnlock = json['tgl_unlock'];
    tglMasuk = json['tgl_masuk'];
  }
}

class InfoFromPrev {
  late String startTime, stopTime, fromGeoNm;
  late double startOdometer, stopOdometer, totalKm;
  late int fromGeoid;
  late Duration durasi;

  InfoFromPrev(this.durasi, this.fromGeoNm, this.fromGeoid, this.startOdometer,
      this.startTime, this.stopOdometer, this.stopTime, this.totalKm);

  InfoFromPrev.fromJSON(JSON json) {
    durasi = json['durasi'];
    fromGeoNm = json['from_geoNm'];
    fromGeoid = json['from_geoid'];
    startOdometer = json['start_odometer'];
    startTime = json['start_time'];
    stopOdometer = json['stop_odometer'];
    stopTime = json['stop_time'];
    totalKm = json['total_km'];
  }
}

class Alert {
  late String eventNm, addr, geoNm, geoCode, tglEvent;
  late double lon, lat, odometer;
  late int geoId, dosId;

  Alert(this.eventNm, this.addr, this.geoNm, this.geoCode, this.tglEvent,
      this.lon, this.lat, this.odometer, this.geoId, this.dosId);

  Alert.fromJSON(JSON json) {
    eventNm = json['eventNm'];
    addr = json['addr'];
    geoNm = json['geo_nm'];
    geoCode = json['geo_code'];
    tglEvent = json['tgl_event'];
    lon = json['lon'];
    lat = json['lat'];
    odometer = json['odometer'];
    geoId = json['geo_id'];
    dosId = json['dos_id'];
  }
}

class Alarm {
  late int id, geoId, geoAreaId;
  late String eventNm,
      addr,
      geoNm,
      geoCode,
      alarmCode,
      geoAreaNm,
      startTime,
      stopTime;
  late double lon, lat, startOdometer, stopOdometer, totalKm;
  late Duration duration;

  Alarm(
      this.id,
      this.geoId,
      this.geoAreaId,
      this.eventNm,
      this.addr,
      this.geoNm,
      this.geoCode,
      this.alarmCode,
      this.geoAreaNm,
      this.startTime,
      this.stopOdometer,
      this.lon,
      this.lat,
      this.startOdometer,
      this.stopTime,
      this.totalKm,
      this.duration);

  Alarm.fromJSON(JSON json) {
    id = json['id'];
    geoId = json['geo_id'];
    geoAreaId = json['geo_area_id'];
    eventNm = json['eventNm'];
    addr = json['addr'];
    geoNm = json['geo_nm'];
    geoCode = json['geo_code'];
    alarmCode = json['alarm_code'];
    geoAreaNm = json['geo_area_nm'];
    startTime = json['start_time'];
    stopOdometer = json['stop_odometer'];
    lon = json['lon'];
    lat = json['lat'];
    startOdometer = json['start_odometer'];
    stopTime = json['stop_time'];
    totalKm = json['total_km'];
    duration = Duration.fromJSON(json['duration']);
  }
}

class InfoAsaldanTujuan {
  late double startOdometer, stopOdometer, totalKm, durasi2;
  late String startTime, stopTime;
  late Duration? durasi, durasiDriving, durasiParking, durasiIdle;
  late ETA eta;

  InfoAsaldanTujuan(
      this.startOdometer,
      this.stopOdometer,
      this.totalKm,
      this.durasi2,
      this.startTime,
      this.stopTime,
      this.durasi,
      this.durasiDriving,
      this.durasiParking,
      this.durasiIdle,
      this.eta);

  InfoAsaldanTujuan.fromJSON(JSON json) {
    startOdometer = json['start_odometer'];
    stopOdometer = json['stop_odometer'];
    totalKm = json['total_km'];
    durasi2 = json['durasi2'];
    startTime = json['start_time'];
    stopTime = json['stop_time'];
    durasi = Duration.fromJSON(json['durasi']);
    durasiDriving = json['durasi_driving'] == null
        ? null
        : Duration.fromJSON(json['durasi_driving']);
    durasiParking = json['durasi_parking'] == null
        ? null
        : Duration.fromJSON(json['durasi_parking']);
    durasiIdle = json['durasi_idle'] == null
        ? null
        : Duration.fromJSON(json['durasi_idle']);
    eta = ETA.fromJSON(json['ETA']);
  }
}

class SafetyInfo {
  late int totalHA, totalHB, totalHC, totalIC;

  SafetyInfo(this.totalHA, this.totalHB, this.totalHC, this.totalIC);

  SafetyInfo.fromJSON(JSON json) {
    totalHA = json['total_HA'];
    totalHB = json['total_HB'];
    totalHC = json['total_HC'];
    totalIC = json['total_IC'];
  }
}

class ETA {
  late String estimatedTime;
  late Duration estimatedDurasi;
  late double totalKm;
  late bool autoEta;

  ETA(this.estimatedTime, this.estimatedDurasi, this.totalKm, this.autoEta);

  ETA.fromJSON(JSON json) {
    estimatedTime = json['estimated_time'];
    totalKm = json['total_km'];
    autoEta = json['auto_eta'];
    estimatedDurasi = Duration.fromJSON(json['estimated_durasi']);
  }
}

class CurrentGeoLocationStatus {
  late int geoId, geotypeId;
  late String geoNm, geoCode, geotypeNm, geoTag, startTime, stopTime;
  late double avgSpeed, totalKm;
  late Duration rfidDriver, duration, durMoving;

  CurrentGeoLocationStatus(
      this.geoId,
      this.geotypeId,
      this.geoNm,
      this.geoCode,
      this.geotypeNm,
      this.geoTag,
      this.startTime,
      this.stopTime,
      this.avgSpeed,
      this.totalKm,
      this.rfidDriver,
      this.duration,
      this.durMoving);

  CurrentGeoLocationStatus.fromJSON(JSON json) {
    geoId = json['geo_id'];
    geotypeId = json['geotype_id'];
    geoNm = json['geo_nm'];
    geoCode = json['geo_code'];
    geotypeNm = json['geotype_nm'];
    geoTag = json['geo_tag'];
    startTime = json['start_time'];
    stopTime = json['stop_time'];
    avgSpeed = json['avg_speed'];
    totalKm = json['total_km'];
    rfidDriver = Duration.fromJSON(json['rfid_driver']);
    duration = Duration.fromJSON(json['duration']);
    durMoving = Duration.fromJSON(json['dur_moving']);
  }
}

class TotalKM {
  late double totalKm;
  late String startDateCounting;

  TotalKM(this.totalKm, this.startDateCounting);

  TotalKM.fromJSON(JSON json) {
    totalKm = json['total_km'];
    startDateCounting = json['start_date_counting'];
  }
}

class CurrentUtilisasiStatus {
  late int utilId, status, geoTipeSeq, nextSeq;
  late String ketStatus;
  late List<Ritase> ritase;

  CurrentUtilisasiStatus(this.utilId, this.status, this.geoTipeSeq,
      this.nextSeq, this.ketStatus, this.ritase);

  CurrentUtilisasiStatus.fromJSON(JSON json) {
    utilId = json['util_id'];
    status = json['status'];
    geoTipeSeq = json['geo_tipe_seq'];
    nextSeq = json['next_seq'];
    ketStatus = json['ket_status'];
    ritase = json['ritase'] == null
        ? []
        : (json['ritase'] as List).map((e) => Ritase.fromJSON(e)).toList();
  }
}

class Ritase {
  late int geoId, geoSeq;
  late String geoNm,
      geoCode,
      geotypeNm,
      geoTag,
      startTime,
      stopTime,
      infoToNext,
      timeIn,
      timeOut;
  late double inOdometer, outOdometer;
  late Duration duration;

  Ritase(
      this.geoId,
      this.geoSeq,
      this.geoNm,
      this.geoCode,
      this.geotypeNm,
      this.geoTag,
      this.startTime,
      this.stopTime,
      this.infoToNext,
      this.timeIn,
      this.timeOut,
      this.inOdometer,
      this.outOdometer,
      this.duration);

  Ritase.fromJSON(JSON json) {
    geoId = json['geo_id'];
    geoSeq = json['geo_seq'];
    geoNm = json['geo_nm'];
    geoCode = json['geo_code'];
    geotypeNm = json['geotype_nm'];
    geoTag = json['geo_tag'];
    startTime = json['start_time'];
    stopTime = json['stop_time'];
    infoToNext = json['info_to_next'];
    timeIn = json['time_in'];
    timeOut = json['time_out'];
    inOdometer = json['in_odometer'];
    outOdometer = json['out_odometer'];
    duration = Duration.fromJSON(json['duration']);
  }
}

class TotalkmToday {
  late double totalKm;
  late String startDateCounting;

  TotalkmToday(this.totalKm, this.startDateCounting);

  TotalkmToday.fromJSON(JSON json) {
    totalKm = json['total_km'];
    startDateCounting = json['start_date_counting'];
  }
}

class CurrentStatusVehicle {
  late int? status;
  late dynamic driving, idle, moving, rfidDriver;
  late String ket;
  late Parking? parking;

  CurrentStatusVehicle(this.status, this.driving, this.idle, this.rfidDriver,
      this.moving, this.ket, this.parking);

  CurrentStatusVehicle.fromJSON(JSON json) {
    status = json['status'];
    driving = json['driving'];
    idle = json['idle'];
    rfidDriver = json['rfid_driver'];
    moving = json['moving'];
    ket = json['ket'];
    parking =
        json['parking'] == null ? null : Parking.fromJSON(json['parking']);
  }
}

class Parking {
  late int geoLocationId, geoAreaId;
  late String startTime,
      stopTime,
      addr,
      geoLocationNM,
      geoAreaNM,
      geoLocationCode,
      geoAreaCode;
  late double lon, lat, fuelConsumption;
  late Duration duration;

  Parking.fromJSON(JSON json) {
    startTime = json['start_time'];
    stopTime = json['stop_time'];
    duration = Duration.fromJSON(json['duration']);
    lon = json['lon'];
    lat = json['lat'];
    addr = json['addr'];
    geoLocationId = json['geo_location_id'];
    geoAreaId = json['geo_area_id'];
    geoLocationNM = json['geo_location_nm'];
    geoAreaNM = json['geo_area_nm'];
    geoLocationCode = json['geo_location_code'];
    geoAreaCode = json['geo_area_code'];
    fuelConsumption = json['fuel_consumption'];
  }
}

class Duration {
  late dynamic value;
  late String text;

  Duration(this.value, this.text);

  Duration.fromJSON(JSON json) {
    value = json['value'];
    text = json['text'];
  }

  JSON get toJSON => {
        'value': value,
        'text': text,
      };
}

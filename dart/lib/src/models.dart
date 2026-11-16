/// Response models for the Planet Positions API.

/// API Response wrapper.
class PlanetpositionsResponse {
  final String status;
  final dynamic error;
  final PlanetpositionsData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  PlanetpositionsResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory PlanetpositionsResponse.fromJson(Map<String, dynamic> json) => PlanetpositionsResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? PlanetpositionsData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Planet Positions API.

class PlanetpositionsData {
  String? planet;
  bool? isBelowHorizon;
  String? date;
  PlanetpositionsDataObserver? observer;
  PlanetpositionsDataRightascension? rightAscension;
  PlanetpositionsDataDeclination? declination;
  PlanetpositionsDataDistance? distance;
  PlanetpositionsDataSiderealtime? siderealTime;
  PlanetpositionsDataHourangle? hourAngle;
  PlanetpositionsDataVectors? vectors;

  PlanetpositionsData({
    this.planet,
    this.isBelowHorizon,
    this.date,
    this.observer,
    this.rightAscension,
    this.declination,
    this.distance,
    this.siderealTime,
    this.hourAngle,
    this.vectors,
  });

  factory PlanetpositionsData.fromJson(Map<String, dynamic> json) => PlanetpositionsData(
      planet: json['planet'],
      isBelowHorizon: json['isBelowHorizon'],
      date: json['date'],
      observer: json['observer'] != null ? PlanetpositionsDataObserver.fromJson(json['observer']) : null,
      rightAscension: json['rightAscension'] != null ? PlanetpositionsDataRightascension.fromJson(json['rightAscension']) : null,
      declination: json['declination'] != null ? PlanetpositionsDataDeclination.fromJson(json['declination']) : null,
      distance: json['distance'] != null ? PlanetpositionsDataDistance.fromJson(json['distance']) : null,
      siderealTime: json['siderealTime'] != null ? PlanetpositionsDataSiderealtime.fromJson(json['siderealTime']) : null,
      hourAngle: json['hourAngle'] != null ? PlanetpositionsDataHourangle.fromJson(json['hourAngle']) : null,
      vectors: json['vectors'] != null ? PlanetpositionsDataVectors.fromJson(json['vectors']) : null,
    );
}

class PlanetpositionsDataObserver {
  num? latitude;
  num? longitude;

  PlanetpositionsDataObserver({
    this.latitude,
    this.longitude,
  });

  factory PlanetpositionsDataObserver.fromJson(Map<String, dynamic> json) => PlanetpositionsDataObserver(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
}

class PlanetpositionsDataRightascension {
  num? hours;
  num? minutes;
  num? seconds;

  PlanetpositionsDataRightascension({
    this.hours,
    this.minutes,
    this.seconds,
  });

  factory PlanetpositionsDataRightascension.fromJson(Map<String, dynamic> json) => PlanetpositionsDataRightascension(
      hours: json['hours'],
      minutes: json['minutes'],
      seconds: json['seconds'],
    );
}

class PlanetpositionsDataDeclination {
  num? degrees;
  num? minutes;
  num? seconds;

  PlanetpositionsDataDeclination({
    this.degrees,
    this.minutes,
    this.seconds,
  });

  factory PlanetpositionsDataDeclination.fromJson(Map<String, dynamic> json) => PlanetpositionsDataDeclination(
      degrees: json['degrees'],
      minutes: json['minutes'],
      seconds: json['seconds'],
    );
}

class PlanetpositionsDataDistance {
  num? km;
  num? lightTravelSeconds;
  num? astronomicalUnits;

  PlanetpositionsDataDistance({
    this.km,
    this.lightTravelSeconds,
    this.astronomicalUnits,
  });

  factory PlanetpositionsDataDistance.fromJson(Map<String, dynamic> json) => PlanetpositionsDataDistance(
      km: json['km'],
      lightTravelSeconds: json['lightTravelSeconds'],
      astronomicalUnits: json['astronomicalUnits'],
    );
}

class PlanetpositionsDataSiderealtime {
  num? hours;
  num? minutes;
  num? seconds;

  PlanetpositionsDataSiderealtime({
    this.hours,
    this.minutes,
    this.seconds,
  });

  factory PlanetpositionsDataSiderealtime.fromJson(Map<String, dynamic> json) => PlanetpositionsDataSiderealtime(
      hours: json['hours'],
      minutes: json['minutes'],
      seconds: json['seconds'],
    );
}

class PlanetpositionsDataHourangle {
  num? hours;
  num? minutes;
  num? seconds;

  PlanetpositionsDataHourangle({
    this.hours,
    this.minutes,
    this.seconds,
  });

  factory PlanetpositionsDataHourangle.fromJson(Map<String, dynamic> json) => PlanetpositionsDataHourangle(
      hours: json['hours'],
      minutes: json['minutes'],
      seconds: json['seconds'],
    );
}

class PlanetpositionsDataVectors {
  num? x;
  num? y;
  num? z;

  PlanetpositionsDataVectors({
    this.x,
    this.y,
    this.z,
  });

  factory PlanetpositionsDataVectors.fromJson(Map<String, dynamic> json) => PlanetpositionsDataVectors(
      x: json['x'],
      y: json['y'],
      z: json['z'],
    );
}

class PlanetpositionsRequest {
  String planet;
  String? date;
  num lat;
  num lon;
  num? alt;

  PlanetpositionsRequest({
    required this.planet,
    this.date,
    required this.lat,
    required this.lon,
    this.alt,
  });

  Map<String, dynamic> toJson() => {
      'planet': planet,
      if (date != null) 'date': date,
      'lat': lat,
      'lon': lon,
      if (alt != null) 'alt': alt,
    };
}

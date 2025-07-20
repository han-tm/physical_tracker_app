import 'dart:io';

class PreRegistrationData {
  int? gender; // 0 = мужчина, 1 = женщина
  DateTime? birthday;
  double? weight;
  double? height;

  double? shoulders;
  double? chest;
  double? waist;
  double? belly;
  double? thigh;
  double? hips;

  File? photoFront;
  File? photoBack;
  File? photoSide;

  PreRegistrationData({
    this.gender,
    this.birthday,
    this.weight,
    this.height,
    this.shoulders,
    this.chest,
    this.waist,
    this.belly,
    this.thigh,
    this.hips,
    this.photoFront,
    this.photoBack,
    this.photoSide,
  });

  Map<String, dynamic> toJson() => {
    'gender': gender,
    'birthday': birthday?.toIso8601String(),
    'weight': weight,
    'height': height,
    'shoulders': shoulders,
    'chest': chest,
    'waist': waist,
    'belly': belly,
    'thigh': thigh,
    'hips': hips,
    'photoFront': photoFront?.path,
    'photoBack': photoBack?.path,
    'photoSide': photoSide?.path,
  };

  static PreRegistrationData fromJson(Map<String, dynamic> json) =>
      PreRegistrationData(
        gender: json['gender'],
        birthday: json['birthday'] != null
            ? DateTime.parse(json['birthday'])
            : null,
        weight: (json['weight'] as num?)?.toDouble(),
        height: (json['height'] as num?)?.toDouble(),
        shoulders: (json['shoulders'] as num?)?.toDouble(),
        chest: (json['chest'] as num?)?.toDouble(),
        waist: (json['waist'] as num?)?.toDouble(),
        belly: (json['belly'] as num?)?.toDouble(),
        thigh: (json['thigh'] as num?)?.toDouble(),
        hips: (json['hips'] as num?)?.toDouble(),
        photoFront: json['photoFront'] != null ? File(json['photoFront']) : null,
        photoBack: json['photoBack'] != null ? File(json['photoBack']) : null,
        photoSide: json['photoSide'] != null ? File(json['photoSide']) : null,
      );

  PreRegistrationData copyWith({
    int? gender,
    DateTime? birthday,
    double? weight,
    double? height,
    double? shoulders,
    double? chest,
    double? waist,
    double? belly,
    double? thigh,
    double? hips,
    File? photoFront,
    File? photoBack,
    File? photoSide,
  }) {
    return PreRegistrationData(
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      shoulders: shoulders ?? this.shoulders,
      chest: chest ?? this.chest,
      waist: waist ?? this.waist,
      belly: belly ?? this.belly,
      thigh: thigh ?? this.thigh,
      hips: hips ?? this.hips,
      photoFront: photoFront ?? this.photoFront,
      photoBack: photoBack ?? this.photoBack,
      photoSide: photoSide ?? this.photoSide,
    );
  }
}
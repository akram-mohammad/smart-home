import 'dart:convert';

Device deviceFromJson(String str) => Device.fromJson(json.decode(str));

String deviceToJson(Device data) => json.encode(data.toJson());

class Device {
  Device({
    this.dCustomName,
    this.dGradeType,
    this.dGradeValue,
    this.dIntensity,
    this.dTypeId,
    this.dLaneNumber,
    this.dUrlLocal,
    this.dUrlOnline,
    this.idContr,
    this.idRoom,
  });

  final String? dCustomName;
  final int? dGradeType;
  final int? dGradeValue;
  final int? dIntensity;
  final int? dTypeId;
  final int? dLaneNumber;
  final String? dUrlLocal;
  final String? dUrlOnline;
  final int? idContr;
  final int? idRoom;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        dCustomName: json["d_custom_name"],
        dGradeType: json["d_grade_type"],
        dGradeValue: json["d_grade_value"],
        dIntensity: json["d_intensity"],
        dTypeId: json["d_type_id"],
        dLaneNumber: json["d_lane_number"],
        dUrlLocal: json["d_url_local"],
        dUrlOnline: json["d_url_online"],
        idContr: json["id_contr"],
        idRoom: json["id_room"],
      );

  Map<String, dynamic> toJson() => {
        "d_custom_name": dCustomName,
        "d_grade_type": dGradeType,
        "d_grade_value": dGradeValue,
        "d_intensity": dIntensity,
        "d_type_id": dTypeId,
        "d_lane_number": dLaneNumber,
        "d_url_local": dUrlLocal,
        "d_url_online": dUrlOnline,
        "id_contr": idContr,
        "id_room": idRoom,
      };
}

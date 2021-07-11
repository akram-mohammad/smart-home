// To parse this JSON data, do
//
//     final room = roomFromJson(jsonString);

import 'dart:convert';

Room roomFromJson(String str) => Room.fromJson(json.decode(str));

String roomToJson(Room data) => json.encode(data.toJson());

class Room {
  Room({
    this.customDesc,
    this.customImg,
    this.customName,
    this.devices,
    this.idMember,
    this.rType,
  });

  final String? customDesc;
  final String? customImg;
  final String? customName;
  final List<int>? devices;
  final String? idMember;
  final int? rType;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        customDesc: json["custom_desc"],
        customImg: json["custom_img"],
        customName: json["custom_name"],
        devices: List<int>.from(json["devices"].map((x) => x)),
        idMember: json["id_member"],
        rType: json["r_type"],
      );

  Map<String, dynamic> toJson() => {
        "custom_desc": customDesc,
        "custom_img": customImg,
        "custom_name": customName,
        "devices": List<dynamic>.from(devices!.map((x) => x)),
        "id_member": idMember,
        "r_type": rType,
      };
}

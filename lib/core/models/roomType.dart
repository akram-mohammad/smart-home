// To parse this JSON data, do
//
//     final roomType = roomTypeFromJson(jsonString);

import 'dart:convert';

RoomType roomTypeFromJson(String str) => RoomType.fromJson(json.decode(str));

String roomTypeToJson(RoomType data) => json.encode(data.toJson());

class RoomType {
  RoomType({
    this.rTypeId,
    this.rDesc,
    this.rName,
    this.rImg,
  });

  final int? rTypeId;
  final String? rDesc;
  final String? rName;
  final String? rImg;

  factory RoomType.fromJson(Map<String, dynamic> json) => RoomType(
        rTypeId: json["r_type_id"],
        rDesc: json["r_desc"],
        rName: json["r_name"],
        rImg: json["r_img"],
      );

  Map<String, dynamic> toJson() => {
        "r_type_id": rTypeId,
        "r_desc": rDesc,
        "r_name": rName,
        "r_img": rImg,
      };
}

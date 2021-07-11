// To parse this JSON data, do
//
//     final DeviceType = DeviceTypeFromJson(jsonString);

import 'dart:convert';

DeviceType DeviceTypeFromJson(String str) =>
    DeviceType.fromJson(json.decode(str));

String DeviceTypeToJson(DeviceType data) => json.encode(data.toJson());

class DeviceType {
  DeviceType({
    this.tdMin,
    this.tdMax,
    this.tdName,
    this.dGradetypeName1,
    this.dGradetypeName2,
    this.dGradetypeName3,
    this.switchTypeFx,
    this.tdIcon,
    this.dTypeId,
  });

  final int? tdMin;
  final int? tdMax;
  final String? tdName;
  final String? dGradetypeName1;
  final String? dGradetypeName2;
  final String? dGradetypeName3;
  final String? switchTypeFx;
  final String? tdIcon;
  final int? dTypeId;

  factory DeviceType.fromJson(Map<String, dynamic> json) => DeviceType(
        tdMin: json["td_min"],
        tdMax: json["td_max"],
        tdName: json["td_name"],
        dGradetypeName1: json["d_gradetype_name_1"],
        dGradetypeName2: json["d_gradetype_name_2"],
        dGradetypeName3: json["d_gradetype_name_3"],
        switchTypeFx: json["switch_type_fx"],
        tdIcon: json["td_icon"],
        dTypeId: json["d_type_id"],
      );

  Map<String, dynamic> toJson() => {
        "td_min": tdMin,
        "td_max": tdMax,
        "td_name": tdName,
        "d_gradetype_name_1": dGradetypeName1,
        "d_gradetype_name_2": dGradetypeName2,
        "d_gradetype_name_3": dGradetypeName3,
        "switch_type_fx": switchTypeFx,
        "td_icon": tdIcon,
        "d_type_id": dTypeId,
      };
}

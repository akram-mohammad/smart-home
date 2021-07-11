import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_home/core/models/device.dart';
import 'package:smart_home/core/models/deviceType.dart';
import 'package:smart_home/core/models/room.dart';
import 'package:smart_home/core/models/roomType.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Get a stream of a single document
  // Stream<SuperHero> streamHero(String id) {
  //   return _db
  //       .collection('heroes')
  //       .document(id)
  //       .snapshots()
  //       .map((snap) => SuperHero.fromMap(snap.data));
  // }

  Future<List<RoomType>> fetchRoomTypesData() async {
    CollectionReference roomTypes = _db.collection('room_type');

    QuerySnapshot roomsSnapshot = await roomTypes.get();

    final List<RoomType> roomTypesData = roomsSnapshot.docs
        .map((doc) => RoomType.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return roomTypesData;
  }

  Future<List<DeviceType>> fetchDeviceTypesData() async {
    CollectionReference deviceTypes = _db.collection('device_type');

    QuerySnapshot devicesSnapshot = await deviceTypes.get();

    final List<DeviceType> deviceTypesData = devicesSnapshot.docs
        .map((doc) => DeviceType.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return deviceTypesData;
  }

  Future<List<Device>> fetchDevices() async {
    var ref = _db.collection('devices');

    QuerySnapshot querySnapshot = await ref.get();

    final List<Device> allData = querySnapshot.docs
        .map((doc) => Device.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return allData;
  }

  Future<List<Room>> fetchRooms() async {
    var ref = _db
        .collection('members')
        .doc('vGoPhuBIPLEeP2KmsjgD')
        .collection('rooms');

    QuerySnapshot querySnapshot = await ref.get();

    final List<Room> allData = querySnapshot.docs
        .map((doc) => Room.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return allData;
  }

  /// Write data
  // Future<void> createHero(String heroId) {
  //   return _db.collection('heroes').document(heroId).setData({/* some data */});
  // }
}

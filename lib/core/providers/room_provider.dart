import 'package:flutter/material.dart';
import 'package:smart_home/core/models/room.dart';
import 'package:smart_home/core/services/firestore_service.dart';

class RoomProvider extends ChangeNotifier {
  List<Room> roomList = [];

  DatabaseService dbs = DatabaseService();

  RoomProvider() {
    getRooms();
  }

  void getRooms() {
    dbs.fetchRooms().then((rList) {
      roomList = [...rList];
      notifyListeners();
    });
  }
}

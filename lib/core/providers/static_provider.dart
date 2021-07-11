import 'package:flutter/cupertino.dart';
import 'package:smart_home/core/models/deviceType.dart';
import 'package:smart_home/core/models/roomType.dart';
import 'package:smart_home/core/services/firestore_service.dart';

class StaticProvider extends ChangeNotifier {
  List<DeviceType> deviceTypeList = [];
  List<RoomType> roomTypeList = [];

  DatabaseService dbs = DatabaseService();

  StaticProvider() {
    getTypes();
  }

  Future<void> getTypes() async {
    await dbs.fetchDeviceTypesData().then((dTypeList) {
      deviceTypeList = [...dTypeList];
      dbs.fetchRoomTypesData().then((rTypeList) {
        roomTypeList = [...rTypeList];
        notifyListeners();
      });
    });
  }
}

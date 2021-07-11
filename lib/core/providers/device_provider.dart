import 'package:flutter/material.dart';
import 'package:smart_home/core/models/device.dart';
import 'package:smart_home/core/services/firestore_service.dart';

class DeviceProvider extends ChangeNotifier {
  List<Device> deviceList = [];

  DatabaseService dbs = DatabaseService();

  DeviceProvider() {
    getDevices();
  }

  void getDevices() {
    dbs.fetchDevices().then((dList) {
      deviceList = [...dList];
      notifyListeners();
    });
  }
}

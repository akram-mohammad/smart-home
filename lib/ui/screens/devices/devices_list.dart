import 'package:flutter/material.dart';
import 'package:smart_home/ui/screens/devices/devices_widget.dart';
import 'package:smart_home/ui/widgets/devices_appbar.dart';

class DevicesList extends StatefulWidget {
  @override
  _DevicesListState createState() => _DevicesListState();
}

class _DevicesListState extends State<DevicesList>
    with AutomaticKeepAliveClientMixin<DevicesList> {
  @override
  bool get wantKeepAlive => true;
  var hasDevices = false;

  @override
  void initState() {
    hasDevices = true;
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: DevicesAppbar(),
        body: TabBarView(
          children: [
            hasDevices
                ? DeviceWidget()
                : Image.asset('assets/imgs/no_device.png'),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
      ),
    );
  }
}

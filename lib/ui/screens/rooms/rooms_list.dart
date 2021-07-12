import 'package:flutter/material.dart';
import 'package:smart_home/ui/screens/rooms/add_room.dart';
import 'package:smart_home/ui/screens/rooms/rooms_widget.dart';
import 'package:smart_home/ui/widgets/devices_appbar.dart';

class RoomsList extends StatefulWidget {
  const RoomsList({Key? key}) : super(key: key);

  @override
  _RoomsListState createState() => _RoomsListState();
}

class _RoomsListState extends State<RoomsList>
    with AutomaticKeepAliveClientMixin<RoomsList> {
  bool get wantKeepAlive => true;

  var hasRooms = false;

  @override
  void initState() {
    hasRooms = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: DevicesAppbar(
          widget: AddRoom(),
          title: 'Rooms',
          tabs: [
            Text('First Floor', style: TextStyle(fontSize: 18.0)),
            Text('Second Floor', style: TextStyle(fontSize: 18.0)),
          ],
        ),
        body: TabBarView(
          children: [
            hasRooms ? RoomsWidget() : Image.asset('assets/imgs/no_device.png'),
            Icon(Icons.directions_transit, size: 350),
          ],
        ),
      ),
    );
  }
}

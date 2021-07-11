import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/core/providers/room_provider.dart';
import 'package:smart_home/core/providers/static_provider.dart';
import 'package:smart_home/ui/widgets/turn_device_widget.dart';

class DeviceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StaticProvider _staticProvider =
        Provider.of<StaticProvider>(context, listen: false);
    return Consumer<RoomProvider>(
      builder: (context, _roomProvider, _) {
        if (_roomProvider.roomList == []) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: _roomProvider.roomList.length,
            itemBuilder: (ctx, index) {
              var roomListDevices = _roomProvider.roomList[index].devices;
              var roomTypeId = _roomProvider.roomList[index].rType!.toInt();
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 10.0, bottom: 5.0),
                    child: Row(
                      children: [
                        Text(
                          _staticProvider.roomTypeList[roomTypeId - 1].rName
                              .toString(),
                          style: TextStyle(fontSize: 17.0),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            minimumSize: Size(12.0, 12.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.0, vertical: 7.0),
                            primary: Theme.of(context).primaryColorLight,
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: roomListDevices!.length,
                        itemBuilder: (ctx, index) {
                          return TurnDevice(
                            index: index,
                            deviceTypeId: roomListDevices[index],
                          );
                        },
                      ),
                    ),
                  )
                ],
              );
            },
          );
        }
      },
    );
  }
}

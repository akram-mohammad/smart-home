import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/core/providers/room_provider.dart';
import 'package:smart_home/core/providers/static_provider.dart';

class RoomsWidget extends StatelessWidget {
  const RoomsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StaticProvider _staticProvider =
        Provider.of<StaticProvider>(context, listen: false);
    return Consumer<RoomProvider>(
      builder: (ctx, _roomProvider, _) {
        if (_roomProvider.roomList == []) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _roomProvider.roomList.length,
              itemBuilder: (ctx, index) {
                var roomListDevices = _roomProvider.roomList[index].devices;
                var roomTypeId = _roomProvider.roomList[index].rType!.toInt();
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage(_staticProvider
                            .roomTypeList[roomTypeId - 1].rImg
                            .toString()),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.multiply),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              _staticProvider.roomTypeList[roomTypeId - 1].rName
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColorLight),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            height: 35,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  _roomProvider.roomList[index].devices!.length,
                              itemBuilder: (ctx, i) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColorLight
                                          .withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        _staticProvider
                                            .deviceTypeList[
                                                roomListDevices![i] - 1]
                                            .tdIcon
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}

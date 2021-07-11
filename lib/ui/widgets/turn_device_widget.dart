import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/core/providers/static_provider.dart';

class TurnDevice extends StatefulWidget {
  final int index;
  final int deviceTypeId;

  TurnDevice({required this.index, required this.deviceTypeId});
  @override
  _TurnDeviceState createState() => _TurnDeviceState();
}

class _TurnDeviceState extends State<TurnDevice> {
  bool _isTurned = false;

  @override
  Widget build(BuildContext context) {
    StaticProvider _staticProvider =
        Provider.of<StaticProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 145,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Theme.of(context).cardColor),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, right: 5.0, left: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    _staticProvider
                        .deviceTypeList[widget.deviceTypeId - 1].tdIcon
                        .toString(),
                    height: 50.0,
                    width: 50.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      minimumSize: Size(15.0, 15.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
                      primary: _isTurned
                          ? Theme.of(context).accentColor
                          : Color(0xFF959497),
                    ),
                    onPressed: () {
                      setState(() {
                        _isTurned = !_isTurned;
                      });
                    },
                    child: Icon(
                      Icons.power_settings_new,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
              Text(
                _staticProvider.deviceTypeList[widget.deviceTypeId - 1].tdName
                    .toString(),
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(
                '250C',
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

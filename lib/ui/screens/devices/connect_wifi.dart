import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:smart_home/ui/screens/devices/connect_device.dart';
import 'package:smart_home/ui/widgets/empty_appbar.dart';
import 'package:smart_home/ui/widgets/regular_elevated_button.dart';

class ConnectWifi extends StatelessWidget {
  ConnectWifi({Key? key}) : super(key: key);
  bool _connected = false;
  List<String> widgetList = ['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: EmptyAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connect to Network',
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.w700),
                    ),
                    _connected
                        ? Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 50.0),
                                child: Center(
                                  child: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    child: LoadingIndicator(
                                      indicatorType: Indicator.values[7],
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Waiting for network connection...',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Image.asset('assets/imgs/confirmed.png'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Select Device',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      minimumSize: Size(12.0, 12.0),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 7.0, vertical: 7.0),
                                      primary:
                                          Theme.of(context).primaryColorLight,
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
                              SizedBox(
                                height: 20.0,
                              ),
                              GridView.count(
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                crossAxisCount: 2,
                                childAspectRatio: (2 / 1.2),
                                controller: new ScrollController(
                                    keepScrollOffset: false),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: widgetList.map((String value) {
                                  return Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/imgs/aircond.png',
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
            RegularElevatedButton(
              title: 'Proceed',
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => ConnectDevice()));
              },
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}

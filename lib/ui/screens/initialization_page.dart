import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/core/providers/static_provider.dart';
import 'package:smart_home/ui/screens/authentication/forgot_pass.dart';
import 'package:smart_home/ui/screens/authentication/sign_up.dart';
import 'package:smart_home/ui/screens/devices/devices_list.dart';
import 'package:smart_home/ui/screens/rooms/rooms_list.dart';
import 'package:smart_home/ui/widgets/navigation_bar.dart';

class InitialPage extends StatefulWidget {
  InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int _selectedIndex = 2;
  var pages = [
    new SignUpPage(),
    new RoomsList(),
    new DevicesList(),
    new ForgotPassword()
  ];

  Future<void> _start() async {
    StaticProvider _staticProvider =
        Provider.of<StaticProvider>(context, listen: false);

    await _staticProvider.getTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder(
          future: _start(),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.done
                  ? pages[_selectedIndex]
                  : Center(child: CircularProgressIndicator())),
      bottomNavigationBar: CustomBottomNavigationBar(
        defaultSelectedIndex: 2,
        iconList: [
          Icons.home,
          Icons.watch_later_outlined,
          Icons.flash_on_rounded,
          Icons.bar_chart,
        ],
        onChange: (val) {
          if (_selectedIndex != val) {
            setState(() {
              _selectedIndex = val;
            });
          }
        },
      ),
    );
  }
}

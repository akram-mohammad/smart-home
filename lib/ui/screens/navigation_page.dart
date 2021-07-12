import 'package:flutter/material.dart';
import 'package:smart_home/ui/screens/authentication/forgot_pass.dart';
import 'package:smart_home/ui/screens/authentication/sign_up.dart';
import 'package:smart_home/ui/screens/devices/devices_list.dart';
import 'package:smart_home/ui/screens/rooms/rooms_list.dart';
import 'package:smart_home/ui/widgets/navigation_bar.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 2;
  var pages = [
    new SignUpPage(),
    new RoomsList(),
    new DevicesList(),
    new ForgotPassword()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: pages[_selectedIndex],
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

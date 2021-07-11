import 'package:flutter/material.dart';

class DevicesAppbar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      elevation: 0,
      brightness: Brightness.dark, // status bar brightness
      backgroundColor: Theme.of(context).primaryColor,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          'Devices',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TabBar(
            labelPadding: EdgeInsets.all(10),
            tabs: [
              Text('All', style: TextStyle(fontSize: 18.0)),
              Text('Light', style: TextStyle(fontSize: 18.0)),
              Text('Socket', style: TextStyle(fontSize: 18.0)),
              Text('Shutter', style: TextStyle(fontSize: 18.0)),
              Text('TV', style: TextStyle(fontSize: 18.0)),
              Text('Air Conditioner', style: TextStyle(fontSize: 18.0)),
            ],
            isScrollable: true,
          ),
        ),
      ),
    );
  }
}

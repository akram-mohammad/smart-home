import 'package:flutter/material.dart';
import 'package:smart_home/ui/screens/devices/add_device.dart';

class DevicesAppbar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(90);
  final List<Widget> tabs;
  final String title;
  DevicesAppbar({required this.tabs, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => AddDevice()));
                  },
                  child: Icon(
                    Icons.add,
                    size: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
      toolbarHeight: 70,
      elevation: 0,
      brightness: Brightness.dark, // status bar brightness
      backgroundColor: Theme.of(context).cardColor,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TabBar(
            labelPadding: EdgeInsets.all(10),
            tabs: tabs,
            isScrollable: true,
          ),
        ),
      ),
    );
  }
}

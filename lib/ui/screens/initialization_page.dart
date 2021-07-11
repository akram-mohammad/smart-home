import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/core/providers/static_provider.dart';
import 'package:smart_home/ui/screens/devices/devices_list.dart';
import 'package:smart_home/ui/widgets/empty_appbar.dart';

class InitialPage extends StatelessWidget {
  InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100), () {
      StaticProvider _staticProvider =
          Provider.of<StaticProvider>(context, listen: false);

      _staticProvider.getTypes().then((val) => Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => DevicesList())));
    });
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: EmptyAppbar(start: true),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

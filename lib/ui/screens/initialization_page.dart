import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/core/providers/static_provider.dart';
import 'package:smart_home/ui/screens/navigation_page.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _start() async {
      StaticProvider _staticProvider =
          Provider.of<StaticProvider>(context, listen: false);

      await _staticProvider.getTypes();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder(
        future: _start(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.done
                ? NavigationPage()
                : Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
    );
  }
}

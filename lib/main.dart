import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/core/providers/device_provider.dart';
import 'package:smart_home/core/providers/room_provider.dart';
import 'package:smart_home/core/providers/static_provider.dart';
import 'package:smart_home/ui/screens/initialization_page.dart';
import 'package:smart_home/ui/widgets/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => DeviceProvider()),
          ChangeNotifierProvider(create: (context) => StaticProvider()),
          ChangeNotifierProvider(create: (context) => RoomProvider()),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      theme: regularThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return InitialPage();
  }
}

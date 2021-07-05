import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_home/ui/screens/authentication/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      theme: ThemeData(
        // Define the default brightness and colors.
        // brightness: Brightness.dark,
        primaryColor: Color(0xFF28292B),
        accentColor: Color(0xFF1FD38F),

        // Define the default font family.
        fontFamily: 'Bozon',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 72.0, fontWeight: FontWeight.w700, color: Colors.white),
          headline2: TextStyle(
              fontSize: 36.0, fontWeight: FontWeight.w700, color: Colors.white),
          headline3: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.w600, color: Colors.white),
          headline4: TextStyle(
              fontSize: 72.0, fontWeight: FontWeight.w700, color: Colors.white),
          headline5: TextStyle(
              fontSize: 72.0, fontWeight: FontWeight.w700, color: Colors.white),
          headline6: TextStyle(
              fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.white),
          bodyText1: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Hind',
              color: Colors.white,
              height: 1.6),
          bodyText2: TextStyle(
              fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
        ),
      ),
      home: MyHomePage(title: 'Smart Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).padding.top = 0;

    return SignUpPage();
  }
}

import 'package:flutter/material.dart';
import 'package:smart_home/ui/screens/authentication/sign_up.dart';

class RegularElevatedButton extends StatelessWidget {
  final String title;
  final bool inverted;
  RegularElevatedButton({required this.title, this.inverted = true});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: inverted ? Theme.of(context).accentColor : Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => SignUpPage()));
      },
      child: Text(
        this.title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: Theme.of(context).primaryColor),
      ),
    );
  }
}

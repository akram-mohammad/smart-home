import 'package:flutter/material.dart';

class RegularElevatedButton extends StatelessWidget {
  final String title;
  final bool inverted;
  final page;
  RegularElevatedButton({required this.title, this.inverted = true, this.page});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return SizedBox(
      width: mediaQuery.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: inverted ? Theme.of(context).accentColor : Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => this.page));
        },
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}

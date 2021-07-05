import 'package:flutter/material.dart';

class RegularTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 15.0, color: Colors.black),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Username',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(left: 20.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

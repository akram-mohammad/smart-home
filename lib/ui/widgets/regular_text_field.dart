import 'package:flutter/material.dart';

class RegularTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function validate;
  final String label;
  final bool obsecure;
  RegularTextField(
      {this.controller,
      required this.validate,
      required this.label,
      this.obsecure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        validate(val);
      },
      obscureText: obsecure,
      style: TextStyle(fontSize: 15.0, color: Colors.black),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: label,
        filled: true,
        isDense: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(left: 20.0, top: 18.0, bottom: 18.0),
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

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ReformedTextField extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final String hint;
  final validator;
  final bool obsecure;

  ReformedTextField(
      {required this.name,
      required this.hint,
      this.obsecure = false,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      validator: validator,
      controller: controller,
      obscureText: obsecure,
      style: TextStyle(fontSize: 15.0, color: Colors.black),
      decoration: InputDecoration(
        errorMaxLines: 3,
        errorStyle: TextStyle(fontSize: 12.0),
        border: InputBorder.none,
        hintText: hint,
        filled: true,
        isDense: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(left: 20.0, top: 18.0, bottom: 18.0),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).accentColor, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OTPTextField extends StatelessWidget {
  OTPTextField({Key? key, this.callback}) : super(key: key);
  final callback;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SizedBox(
        width: 40.0,
        child: TextFormField(
          onChanged: (val) {
            callback(val);
            node.nextFocus();
          },
          keyboardType: TextInputType.number,
          style: TextStyle(
              fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '0',
            filled: true,
            isDense: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).accentColor),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}

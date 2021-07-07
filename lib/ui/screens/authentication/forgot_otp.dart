import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/ui/screens/authentication/sign_in.dart';
import 'package:smart_home/ui/widgets/empty_appbar.dart';
import 'package:smart_home/ui/widgets/opt_text_field.dart';
import 'package:smart_home/ui/widgets/regular_elevated_button.dart';

class OTPPage extends StatefulWidget {
  final String email;
  OTPPage({required this.email});

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _userOTP = [];
  String stringList = '';

  void verifyOTP() async {
    stringList = _userOTP.join("");
    print(stringList);
    var res = await EmailAuth.validate(
        receiverMail: widget.email, userOTP: stringList);
    stringList = '';
    if (res) {
      print("OTP Verified");
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => LoginPage()));
    } else {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Wrong OTP"),
        backgroundColor: Colors.red,
      ));
      print("Invalid OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: EmptyAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Verification Code',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 26.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/imgs/otp.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      child: Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OTPTextField(
                              callback: (val) {
                                setState(() {
                                  _userOTP.add(val);
                                });
                              },
                            ),
                            OTPTextField(
                              callback: (val) {
                                setState(() {
                                  _userOTP.add(val);
                                });
                              },
                            ),
                            OTPTextField(
                              callback: (val) {
                                setState(() {
                                  _userOTP.add(val);
                                });
                              },
                            ),
                            OTPTextField(
                              callback: (val) {
                                setState(() {
                                  _userOTP.add(val);
                                });
                              },
                            ),
                            OTPTextField(
                              callback: (val) {
                                setState(() {
                                  _userOTP.add(val);
                                  print(_userOTP);
                                });
                              },
                            ),
                            OTPTextField(
                              callback: (val) {
                                setState(() {
                                  _userOTP.add(val);
                                  print(_userOTP);
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Please enter the verification \ncode sent to your email',
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
            ),
            RegularElevatedButton(
              title: 'Verify',
              onPress: () {
                verifyOTP();
                _formKey.currentState!.reset();
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            RegularElevatedButton(
              title: 'Resend OTP',
              onPress: () {},
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_home/ui/widgets/empty_appbar.dart';
import 'package:smart_home/ui/widgets/opt_text_field.dart';
import 'package:smart_home/ui/widgets/regular_elevated_button.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({Key? key}) : super(key: key);

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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OTPTextField(),
                          OTPTextField(),
                          OTPTextField(),
                          OTPTextField(),
                          OTPTextField()
                        ],
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
            Column(
              children: [
                RegularElevatedButton(title: 'Verify'),
                SizedBox(
                  height: 15.0,
                ),
                RegularElevatedButton(title: 'Resend OTP'),
                SizedBox(
                  height: 20.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

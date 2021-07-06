import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/ui/screens/authentication/forgot_pass.dart';
import 'package:smart_home/ui/screens/authentication/sign_up.dart';
import 'package:smart_home/ui/widgets/empty_appbar.dart';
import 'package:smart_home/ui/widgets/regular_elevated_button.dart';
import 'package:smart_home/ui/widgets/regular_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: EmptyAppbar(start: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back,',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      'It\'s nice to see you again',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/imgs/login2.svg',
                  width: 300.0,
                  height: 300.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              RegularTextField(),
              SizedBox(
                height: 15.0,
              ),
              RegularTextField(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: mediaQuery.width,
                  child: RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      text: 'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1FD38F),
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => ForgotPassword(),
                            ),
                          );
                        },
                    ),
                  ),
                ),
              ),
              RegularElevatedButton(title: 'Login'),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: RichText(
                  text: new TextSpan(
                    children: [
                      new TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      new TextSpan(
                        text: 'Register Now',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1FD38F),
                        ),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => SignUpPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

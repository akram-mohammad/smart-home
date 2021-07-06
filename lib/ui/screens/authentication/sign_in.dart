import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      appBar: EmptyAppbar(),
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
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontFamily: 'Bozon'),
                  ),
                ),
              ),
              RegularElevatedButton(title: 'Login'),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  'Don\'t have an account ? Register Now',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontFamily: 'Bozon'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/ui/widgets/regular_elevated_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: mediaQuery.height * 0.13,
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/imgs/shicon.svg',
                  width: 250.0,
                  height: 250.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Text(
                'This is a home automation app that allows users to control their smart home accessories such as: lights, switches, air conditioners, etc.',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: mediaQuery.height * 0.1,
              ),
              SizedBox(
                width: mediaQuery.width,
                child: RegularElevatedButton(
                  title: 'Login',
                  inverted: false,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: mediaQuery.width,
                child: RegularElevatedButton(
                  title: 'Register',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/ui/screens/authentication/sign_in.dart';
import 'package:smart_home/ui/widgets/empty_appbar.dart';
import 'package:smart_home/ui/widgets/regular_elevated_button.dart';

class PasswordUpdatedPage extends StatelessWidget {
  const PasswordUpdatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: EmptyAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/imgs/pass_confirmed.svg',
                  width: 300.0,
                  height: 300.0,
                ),
              ),
              Text(
                'Password Updated',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Your Password Has Been Updated!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 25.0,
              ),
              RegularElevatedButton(
                title: 'Login',
                page: LoginPage(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

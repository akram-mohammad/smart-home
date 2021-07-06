import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/ui/widgets/empty_appbar.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: EmptyAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Password',
              style: Theme.of(context).textTheme.headline3,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/imgs/forgot_password.svg',
                width: 300.0,
                height: 300.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

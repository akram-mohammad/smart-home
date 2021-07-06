import 'package:flutter/material.dart';
import 'package:smart_home/ui/screens/authentication/password_updated.dart';
import 'package:smart_home/ui/widgets/empty_appbar.dart';
import 'package:smart_home/ui/widgets/regular_elevated_button.dart';
import 'package:smart_home/ui/widgets/regular_text_field.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: EmptyAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create New Password',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28.0),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 15.0),
                child: Text(
                    'Your new password must be different from previously used passwords'),
              ),
              RegularTextField(),
              SizedBox(
                height: 15.0,
              ),
              RegularTextField(),
              SizedBox(
                height: 15.0,
              ),
              RegularElevatedButton(
                title: 'Change Password',
                page: PasswordUpdatedPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/ui/screens/authentication/sign_in.dart';
import 'package:smart_home/ui/widgets/form_text_field.dart';
import 'package:smart_home/ui/widgets/regular_elevated_button.dart';

class ForgotPassword extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _emailController = TextEditingController();

  void reset(BuildContext context) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: _emailController.text);
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => LoginPage()));
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Email not found"),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        'No worries, you can reset it',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'assets/imgs/forgot_password.svg',
                      width: 250.0,
                      height: 250.0,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Center(
                    child: Text(
                      'Enter the email address \nassociated with your account',
                      style: Theme.of(context).textTheme.caption,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      'We will email you a verification code \nto reset your password',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: ReformedTextField(
              name: 'email',
              hint: 'Email Address',
              controller: _emailController,
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(context,
                      errorText: 'This field is required'),
                  FormBuilderValidators.email(context,
                      errorText: 'Enter a valid email address'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          RegularElevatedButton(
              title: 'Send Reset Email',
              onPress: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  reset(context);
                }
              }),
          SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }
}

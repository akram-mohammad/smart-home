// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/ui/screens/authentication/sign_in.dart';
import 'package:smart_home/ui/widgets/empty_appbar.dart';
import 'package:smart_home/ui/widgets/regular_elevated_button.dart';
import 'package:smart_home/ui/widgets/regular_text_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('tests');
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: EmptyAppbar(start: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/imgs/shicon.svg',
                  width: 70.0,
                  height: 70.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 30.0,
                ),
                RegularTextField(),
                SizedBox(
                  height: 15.0,
                ),
                RegularTextField(),
                SizedBox(
                  height: 15.0,
                ),
                RegularTextField(),
                SizedBox(
                  height: 15.0,
                ),
                RegularTextField(),
                SizedBox(
                  height: 15.0,
                ),
                RegularTextField(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    'By clicking "Create Account", you agree to our Terms & Conditions and Privacy Policy',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                RegularElevatedButton(
                  title: 'Register',
                ),
                SizedBox(
                  height: 20.0,
                ),
                RichText(
                  text: new TextSpan(
                    children: [
                      new TextSpan(
                        text: 'Already have a smarthome account? ',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      new TextSpan(
                        text: 'Sign in',
                        style: Theme.of(context).textTheme.headline5,
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => LoginPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// test() async {
//   var url = Uri.parse('http://207.154.253.84:8080/apis');
//   var response = await http.get(url);
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
// }

// return FutureBuilder<DocumentSnapshot>(
// future: users.doc('yUL5uHMjOy2Qs73dtMm7').get(),
// builder:
// (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
// if (snapshot.hasError) {
// return Text("Something went wrong");
// }
//
// if (snapshot.hasData && !snapshot.data!.exists) {
// return Text("Document does not exist");
// }
//
// if (snapshot.connectionState == ConnectionState.done) {
// Map<String, dynamic> data =
// snapshot.data!.data() as Map<String, dynamic>;
// return Text("${data['text']}");
// }
//
// return Text("loading");
// },
// );

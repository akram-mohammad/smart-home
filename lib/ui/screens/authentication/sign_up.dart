// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.dark, // status bar brightness
        backgroundColor: Theme.of(context).primaryColor,
        leading: Stack(
          children: [
            Center(
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Color(0xFF4C5154),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                    child: Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 17,
                )),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/imgs/shicon.png'),
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.headline3,
                ),
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
                    'By clicking "Create Account", you agree to our Terms \n& Conditions and Privacy Policy',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).accentColor,
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Register'),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Already have a smarthome account? Sign in',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
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

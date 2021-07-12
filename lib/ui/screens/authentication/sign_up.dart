import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/core/providers/room_provider.dart';
import 'package:smart_home/core/providers/static_provider.dart';
import 'package:smart_home/ui/screens/authentication/forgot_otp.dart';
import 'package:smart_home/ui/widgets/regular_elevated_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final String _passwordValidation =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
  final String _phoneValidation = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final String _nameValidation = r'^[a-zA-Z0-9\-_\.]+$';

  void validator(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
        sendOTP();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => OTPPage(email: _emailController.text)));
      } on FirebaseAuthException catch (e) {
        print('Failed with error code: ${e.code}');
        print(e.message);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Email is already registered"),
          backgroundColor: Colors.red,
        ));
      }
    } else {
      print('failed');
      print("${_formKey.currentState!.validate()}");
    }
  }

  void sendOTP() async {
    EmailAuth.sessionName = 'Register Session';
    var res = await EmailAuth.sendOtp(receiverMail: _emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    StaticProvider _staticProvider =
        Provider.of<StaticProvider>(context, listen: false);

    return Consumer<RoomProvider>(
      builder: (context, _roomProvider, _) {
        if (_roomProvider.roomList == []) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              Container(
                height: 250,
                child: ListView.builder(
                  itemCount: _roomProvider.roomList.length,
                  itemBuilder: (ctx, index) {
                    var roomListDevices = _roomProvider.roomList[index].devices;
                    print('hi from ${_roomProvider.roomList}');
                    return Column(
                      children: [
                        Text(_roomProvider.roomList[index].rType.toString()),
                        Container(
                          height: 100,
                          child: ListView.builder(
                            itemCount: roomListDevices!.length,
                            itemBuilder: (ctx, index) {
                              print(
                                  'hi from ${_staticProvider.deviceTypeList}');
                              return Text(_staticProvider
                                  .deviceTypeList[roomListDevices[index] - 1]
                                  .dTypeId
                                  .toString());
                            },
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 100),
              RegularElevatedButton(
                  title: 'Press me',
                  onPress: () {
                    firestore
                        .collection('members')
                        .doc('vGoPhuBIPLEeP2KmsjgD')
                        .collection('rooms')
                        .doc('2')
                        .set({
                      "custom_desc": '',
                      "custom_img": '',
                      "custom_name": '',
                      "devices": [2, 1],
                      "id_member": '',
                      "r_type": 1,
                    });
                    _roomProvider.getRooms();
                  })
            ],
          );
        }
      },
    );
  }
}

// test() async {
//   var url = Uri.parse('http://207.154.253.84:8080/apis');
//   var response = await http.get(url);
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
// }

// CollectionReference users =
// FirebaseFirestore.instance.collection('members');
// return Scaffold(
// backgroundColor: Colors.black,
// body: FutureBuilder<DocumentSnapshot>(
// future: users.doc('vGoPhuBIPLEeP2KmsjgD').get(),
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
// return Padding(
// padding: const EdgeInsets.all(35.0),
// child: Column(
// children: [
// Text("${data}"),
// ],
// ),
// );
// }
//
// return Text("loading");
// },
// ),
// );

//
// return Scaffold(
// backgroundColor: Theme.of(context).primaryColor,
// appBar: EmptyAppbar(start: true),
// body: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20.0),
// child: SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SvgPicture.asset(
// 'assets/imgs/shicon.svg',
// width: 60.0,
// height: 60.0,
// ),
// SizedBox(
// height: 15.0,
// ),
// Text(
// 'Create Account',
// style: Theme.of(context).textTheme.headline3,
// ),
// SizedBox(
// height: 20.0,
// ),
// Form(
// key: _formKey,
// autovalidateMode: AutovalidateMode.onUserInteraction,
// child: Column(
// children: [
// ReformedTextField(
// name: 'email',
// hint: 'Email Address',
// controller: _emailController,
// validator: FormBuilderValidators.compose([
// FormBuilderValidators.required(context,
// errorText: 'This field is required'),
// FormBuilderValidators.email(context,
// errorText: 'Enter a valid email address'),
// ])),
// SizedBox(
// height: 10.0,
// ),
// ReformedTextField(
// name: 'password',
// hint: 'Password',
// controller: _passwordController,
// obsecure: true,
// validator: FormBuilderValidators.compose([
// FormBuilderValidators.required(context,
// errorText: 'This field is required'),
// FormBuilderValidators.match(
// context, _passwordValidation,
// errorText:
// 'Invalid password, minimum length: 6,\nat least one uppercase, at least one digit,\nat least one alphanumeric character')
// ]),
// ),
// SizedBox(
// height: 10.0,
// ),
// ReformedTextField(
// name: 'confirmPass',
// hint: 'Confirm Password',
// controller: _confirmPassController,
// obsecure: true,
// validator: (val) {
// if (val.isEmpty) return 'This field is required';
// if (val != _passwordController.text)
// return 'This field must match the password field';
// return null;
// },
// ),
// SizedBox(
// height: 10.0,
// ),
// ReformedTextField(
// name: 'name',
// hint: 'Name',
// controller: _nickNameController,
// validator: FormBuilderValidators.compose([
// FormBuilderValidators.required(context,
// errorText: 'This field is required'),
// FormBuilderValidators.match(context, _nameValidation,
// errorText:
// 'Invalid name. Name can have letters and spaces only'),
// ])),
// SizedBox(
// height: 10.0,
// ),
// ReformedTextField(
// name: 'phone',
// hint: 'Phone Number',
// controller: _phoneController,
// validator: FormBuilderValidators.compose([
// FormBuilderValidators.required(context,
// errorText: 'This field is required'),
// FormBuilderValidators.match(context, _phoneValidation,
// errorText: 'Invalid phone number'),
// ])),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(vertical: 25.0),
// child: Text(
// 'By clicking "Create Account", you agree to our Terms & Conditions and Privacy Policy',
// style: Theme.of(context).textTheme.bodyText1,
// ),
// ),
// RegularElevatedButton(
// title: 'Register',
// onPress: () {
// validator(context);
// },
// ),
// SizedBox(
// height: 20.0,
// ),
// RichText(
// text: new TextSpan(
// children: [
// new TextSpan(
// text: 'Already have a smarthome account? ',
// style: Theme.of(context).textTheme.headline6,
// ),
// new TextSpan(
// text: 'Sign in',
// style: TextStyle(
// fontSize: 14.0,
// fontWeight: FontWeight.w600,
// color: Color(0xFF1FD38F),
// ),
// recognizer: new TapGestureRecognizer()
// ..onTap = () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (ctx) => LoginPage(),
// ),
// );
// },
// ),
// ],
// ),
// ),
// SizedBox(
// height: 20.0,
// ),
// ],
// ),
// ),
// ),
// );

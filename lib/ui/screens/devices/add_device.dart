import 'package:flutter/material.dart';
import 'package:smart_home/ui/widgets/empty_appbar.dart';
import 'package:smart_home/ui/widgets/regular_elevated_button.dart';
import 'package:smart_home/ui/widgets/regular_text_field.dart';

class AddDevice extends StatelessWidget {
  AddDevice({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: EmptyAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add New Device',
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Add your smart device by establishing a connection and customize your configuration.',
                      style: TextStyle(fontSize: 14.0, color: Colors.white60),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Instructions:',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 8.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Add controller secret key.',
                            style: TextStyle(fontSize: 15.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 8.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Connect to HomeOnPhone wifi.',
                            style: TextStyle(fontSize: 15.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 8.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Select the device.',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 8.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Add the device to a room.',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RegularTextField(
              controller: _emailController,
              validate: () {},
              label: 'Add Controller Secret Key',
            ),
            SizedBox(
              height: 10.0,
            ),
            RegularElevatedButton(title: 'Add Secret Key', onPress: () {}),
            SizedBox(height: 20.0)
          ],
        ),
      ),
    );
  }
}

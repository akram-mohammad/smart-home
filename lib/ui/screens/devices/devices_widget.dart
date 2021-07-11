import 'package:flutter/material.dart';
import 'package:smart_home/ui/widgets/turn_device_widget.dart';

class DeviceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Bedroom',
              style: Theme.of(context).textTheme.headline6,
            ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15.0,
              ),
              shape: CircleBorder(),
            )
          ],
        ),
        Container(
          height: 115,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (ctx, index) {
              return TurnDevice();
            },
          ),
        )
      ],
    );
  }
}

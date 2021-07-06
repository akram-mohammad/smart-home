import 'package:flutter/material.dart';

class EmptyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppbar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 17,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

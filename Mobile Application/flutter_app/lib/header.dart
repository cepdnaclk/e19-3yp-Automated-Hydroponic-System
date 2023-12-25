import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    late Color appbarcolor = const Color(0xFFE9F1E4);

    return AppBar(
      toolbarHeight: 100,
      backgroundColor: appbarcolor,

      title: Align(
        alignment: Alignment.bottomLeft,
        child: Image.asset(
          'assets/logo.png',
          height: 50,
        ),
      ),

      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              IconButton(
                onPressed: () {

                },
                icon: Icon(
                    color: Color(0xFF0D7817),
                    Icons.account_circle),
              ),
              IconButton(
                onPressed: () {

                },
                icon: Icon(
                    color: Color(0xFF0D7817),
                    Icons.menu),
              ),
              IconButton(
                onPressed: () {

                },
                icon: Icon(
                    color: Color(0xFF0D7817),
                    Icons.help),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class StaticHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFE9F1E4),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            'assets/logo.png', // Replace 'assets/logo.png' with your logo's path
            width: 50, // Adjust the width as needed
            height: 50, // Adjust the height as needed
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.0);
}


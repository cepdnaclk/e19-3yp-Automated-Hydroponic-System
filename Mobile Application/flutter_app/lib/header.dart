import 'package:flutter/material.dart';
import 'package:testapp/profile.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE9F1E4),
      width: double.infinity,
      height: 270,
      padding: EdgeInsets.only(top: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/Profile.jpg"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Welcome Back !',
              style: TextStyle(
                color: Color(0xFF0D7817),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                //decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// class Header extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
//   late Color appbarcolor = const Color(0xFFE9F1E4);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Row(
//         children: [
//           Expanded(
//             child: Align(
//               alignment: Alignment.bottomLeft,
//               child: Image.asset(
//                 'assets/logo.png',
//                 height: 50,
//               ),
//             ),
//           ),
//           PopupMenuButton(
//             itemBuilder: (BuildContext context) => [
//               PopupMenuItem(
//                 child: Text('Item 1'),
//                 value: 'item1',
//               ),
//               PopupMenuItem(
//                 child: Text('Item 2'),
//                 value: 'item2',
//               ),
//               // Add more items as needed
//             ],
//             onSelected: (value) {
//               // Handle selection here
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }














// class Header extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Size get preferredSize => Size.fromHeight(100);

//   @override
//   Widget build(BuildContext context) {
//     late Color appbarcolor = const Color(0xFFE9F1E4);

//     return AppBar(
//       toolbarHeight: 100,
//       backgroundColor: appbarcolor,

      // title: Align(
      //   alignment: Alignment.bottomLeft,
      //   child: Image.asset(
      //     'assets/logo.png',
      //     height: 50,
      //   ),
      // ),





      // actions: [
      //   Align(
      //     alignment: Alignment.centerRight,
      //     child: Column(
      //       children: [
              
              // IconButton(
              //   onPressed: () {

              //   },
              //   icon: Icon(
              //       color: Color(0xFF0D7817),
              //       Icons.account_circle),
              // ),

              // IconButton(
              //   onPressed: () {

              //   },
              //   icon: Icon(
              //       color: Color(0xFF0D7817),
              //       Icons.menu),
              // ),

              // IconButton(
              //   onPressed: () {

              //   },
              //   icon: Padding(
              //     padding: const EdgeInsets.only(right: 25.0),
              //     child: Icon(
              //         color: Color(0xFF0D7817),
              //         Icons.menu),
              //   ),
              // ),
      //       ],
      //     ),
      //   ),
      // ],
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class Header extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Size get preferredSize => Size.fromHeight(100);

//   @override
//   Widget build(BuildContext context) {
//     late Color appbarcolor = const Color(0xFFE9F1E4);

//     return AppBar(
//       toolbarHeight: 100,
//       backgroundColor: appbarcolor,
//       leading: Padding(
//         padding: const EdgeInsets.only(left: 20.0),
//         child: IconButton(
//           icon: Icon(Icons.menu), // Drawer icon
//           onPressed: () {
            
//             //Scaffold.of(context).openDrawer(); // Opens the drawer
//           },
//         ),
//       ),
//       title: Align(
//         alignment: Alignment.bottomRight,
//         child: Image.asset(
//           'assets/logo.png',
//           height: 50,
//         ),
//       ),
//     );
//   }


// }


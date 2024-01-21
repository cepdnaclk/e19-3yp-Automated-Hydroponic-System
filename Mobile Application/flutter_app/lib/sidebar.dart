import 'package:flutter/material.dart';
import 'package:testapp/account/account_page.dart';
import 'package:testapp/header.dart';
import 'package:testapp/help.dart';
import 'package:testapp/plant_log/plant_log.dart';
import 'package:testapp/profile.dart';
import 'package:testapp/user_manual.dart';


class SideBarState extends StatefulWidget {
  const SideBarState({super.key});

  @override
  State<SideBarState> createState() => _SideBarStateState();
}

class _SideBarStateState extends State<SideBarState> {

  var currentPage = DrawerSections.plant_log;

  @override
  Widget build(BuildContext context) {

    var container;
    if (currentPage == DrawerSections.account_page) {
      container = AccountPage();
    }
    else if (currentPage == DrawerSections.plant_log) {
      container = PlantLog();
    }
    else if (currentPage == DrawerSections.help) {
      container = Help();
    }
    else if (currentPage == DrawerSections.user_manual) {
      container = UserGuide();
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Color(0xFFE9F1E4),
           // To push the logo to the right corner
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/logo.png', 
                width: 50, 
                height: 50, 
              ),
            ],
          ),
        ),
      ),

      body: container,

      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Header(),
                DrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget DrawerList(){
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          menuItem(1, "Your Profile", Icons.arrow_forward_ios_outlined,
            currentPage == DrawerSections.account_page ? true : false
          ),
          menuItem(2, "Plant Log", Icons.arrow_forward_ios_outlined,
            currentPage == DrawerSections.plant_log ? true : false
          ),

          Divider(),

          menuItem(3, "Help", Icons.help_center_outlined,
            currentPage == DrawerSections.help ? true : false
          ),
          menuItem(4, "User Guide", Icons.book_online_outlined,
            currentPage == DrawerSections.user_manual ? true : false
          ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Color(0xFFE9F1E4) : Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.account_page;
            }
            else if (id == 2) {
              currentPage = DrawerSections.plant_log;
            }
            else if (id == 3) {
              currentPage = DrawerSections.help;
            }
            else if (id == 4) {
              currentPage = DrawerSections.user_manual;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded (
                //flex: 1,
                child: Icon(
                  icon,
                  size: 20.0,
                  color: Color(0xFF0D7817),
                ),
              ),
              Expanded (
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF0D7817),
                    fontFamily:'Poppins', 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  account_page,
  plant_log,
  help,
  user_manual,
}
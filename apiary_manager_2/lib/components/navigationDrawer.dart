import 'package:apiary_manager_2/apiariesScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mainScreen.dart';
import '../settingsScreen.dart';
import '../tasksScreen.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      // decoration: BoxDecoration(
      //   color: Colors.orange,
      // ),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Apiary Manager",
                style: TextStyle(
                    // color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));

  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text("Home"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.task_alt),
            title: Text("Apiaries"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ApiariesScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.task_alt),
            title: Text("Tasks"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => TasksScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          ),
        ],
      );
//pushReplacement
}

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
        child: Stack(
          children: const <Widget>[
            Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text(
                "Apiary Manager",
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.all_inbox_outlined),
            title: const Text("Apiaries"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ApiariesScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.task_alt),
            title: const Text("Tasks"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const TasksScreen(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text("Credits"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
          ),

        ],
      );
//pushReplacement
}

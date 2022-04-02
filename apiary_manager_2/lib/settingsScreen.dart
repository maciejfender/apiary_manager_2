import 'package:apiary_manager_2/components/navigationDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Settings"),

    ),
    body: Center(
      child: Text("TEST"),
    ),
    drawer: NavigationDrawer(),
  );
}
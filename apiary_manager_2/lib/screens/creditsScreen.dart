import 'package:apiary_manager_2/components/navigationDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Credits"),
        ),
        body: const Center(
          child: Text("EMPTY"),
        ),
        drawer: const NavigationDrawer(),
      );
}

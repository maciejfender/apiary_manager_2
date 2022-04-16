import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/navigationDrawer.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apiaries"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.helloWorld),
          ],
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'components/navigationDrawer.dart';

class ApiariesScreen extends StatefulWidget {
  const ApiariesScreen({Key? key}) : super(key: key);

  @override
  State<ApiariesScreen> createState() => _ApiariesScreenState();
}

class _ApiariesScreenState extends State<ApiariesScreen> {
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

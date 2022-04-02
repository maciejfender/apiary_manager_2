import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates:  [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
        ],
      onGenerateTitle: (context) {
        var t =  AppLocalizations.of(context);
        return t!.appTitle;
      },
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 227, 177, 60),
          // title: Text(AppLocalizations.of(context)!.appTitle),
          
        ),
        body: Center(
          child: Column(children: <Widget>[
              Text(AppLocalizations.of(context).appTitle)
          ]),
        ),
      ),
    );
  }
}

import 'dart:convert' as convert;

import 'package:apiary_manager_2/model/ApiaryData.dart';
import 'package:apiary_manager_2/screens/apiaryDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/navigationDrawer.dart';
import '../webApi/apiaryWebService.dart';
import 'createApiaryScreen.dart';

class ApiariesEditScreen extends StatelessWidget {
  final int apiaryId;

  const ApiariesEditScreen(this.apiaryId,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("$apiaryId");
  }

}

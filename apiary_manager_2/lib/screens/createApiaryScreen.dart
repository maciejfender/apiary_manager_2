import 'dart:convert' as convert;

import 'package:apiary_manager_2/model/ApiaryData.dart';
import 'package:apiary_manager_2/screens/apiaryDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/navigationDrawer.dart';
import '../webApi/apiaryWebService.dart';

class CreateApiaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create apiary"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}

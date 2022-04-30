
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateHiveScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apiary Manager"),
      ),
      body: getBody(),
    );
  }

  Widget getBody(){
    return Column(
      children: [

      ],
    );
  }
}
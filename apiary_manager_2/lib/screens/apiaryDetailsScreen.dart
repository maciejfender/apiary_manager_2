import 'package:apiary_manager_2/model/ApiaryData.dart';
import 'package:apiary_manager_2/webApi/apiaryWebService.dart';
import 'package:flutter/material.dart';

import '../components/navigationDrawer.dart';

class ApiaryDetailsScreen extends StatefulWidget {
  int apiaryId;

  ApiaryDetailsScreen(this.apiaryId, {Key? key}) : super(key: key);

  @override
  State<ApiaryDetailsScreen> createState() =>
      _ApiaryDetailsScreenState(apiaryId);
}

class _ApiaryDetailsScreenState extends State<ApiaryDetailsScreen> {
  int apiaryId = -1;

  _ApiaryDetailsScreenState(this.apiaryId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apiary Manager 2'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: getApiaryDetails(apiaryId),
          builder: ((context, snapshot) {
            if (snapshot.data == null) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              var data = apiaryToJson(snapshot.data as Apiary);
              return Text(data);
            }
          }),
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
}

import 'package:apiary_manager_2/model/ApiaryData.dart';
import 'package:apiary_manager_2/webApi/apiaryWebService.dart';
import 'package:flutter/cupertino.dart';
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

  String title = 'Apiary Manager 2';

  _ApiaryDetailsScreenState(this.apiaryId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: getApiaryDetails(apiaryId),
        builder: ((context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else {
            Apiary apiary = snapshot.data as Apiary;

            return Container(
              // color: Colors.blue,
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  // color: Colors.red,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: Column(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            getRow("name", apiary.name),
                            getRow("sun", "${apiary.sunExposure}"),
                            getRow("humidity", "${apiary.humidity}"),
                            getRow("description", apiary.description),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }),
      ),
      drawer: NavigationDrawer(),
    );
  }

  Widget getRow(String label, String value) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(fontSize: 20),
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        ),
        Expanded(
          // child: Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          // width: double.infinity,
          // alignment: Alignment.center,
          // decoration: const BoxDecoration(
          //   color: Colors.orangeAccent,
          //   shape: BoxShape.rectangle,
          //   borderRadius:
          //       BorderRadius.all(Radius.circular(20)),
          // ),
          child: Text(
            value,
            // maxLines: 1,
            style: TextStyle(
              fontSize: 16,
            ),
            overflow: TextOverflow.visible,
          ),
          // ),
        ),
      ],
    );
  }
}

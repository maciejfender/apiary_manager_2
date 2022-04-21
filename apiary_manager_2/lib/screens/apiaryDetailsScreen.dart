import 'package:apiary_manager_2/model/ApiaryData.dart';
import 'package:apiary_manager_2/screens/apiariesEditScreen.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.info_outlined)),
              Tab(icon: Icon(Icons.bookmarks_outlined)),
            ],
          ),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(
            //     Icons.delete,
            //     color: Colors.red,
            //   ),
            //   onPressed: () {},
            // ),
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ApiariesEditScreen(apiaryId)));
              },
            ),
          ],
        ),
        body: TabBarView(children: [
          renderBodyDetails(),
          Text("TODO HIVES"),
        ]),
        drawer: NavigationDrawer(),
      ),
    );
  }

  Widget renderBodyDetails() {
    return FutureBuilder(
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
                    getOneFieldWithLabel(
                        "Name", (snapshot.data as Apiary).name),
                    getOneFieldWithLabel(
                        "Location", (snapshot.data as Apiary).location),
                    getOneFieldWithLabel("Number of hives", "NONE"),
                    getOneFieldWithLabel("Sun exposure",
                        "${(snapshot.data as Apiary).sunExposure}"),
                    getOneFieldWithLabel(
                        "Humidity", "${(snapshot.data as Apiary).humidity}"),
                    getOneFieldWithLabel(
                        "Description", (snapshot.data as Apiary).description),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  Widget getOneFieldWithLabel(String label, String value) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Text(
            label,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Card(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(
              value,
              // maxLines: 1,
              style: TextStyle(
                fontSize: 16,
              ),
              overflow: TextOverflow.visible,
            ),
          ),
        ),
      ],
    );
  }
}

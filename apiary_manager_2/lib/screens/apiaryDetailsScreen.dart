import 'package:apiary_manager_2/model/ApiaryData.dart';
import 'package:apiary_manager_2/screens/apiariesEditScreen.dart';
import 'package:apiary_manager_2/webApi/apiaryWebService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../components/navigationDrawer.dart';
import '../model/HiveData.dart';

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
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ApiariesEditScreen(apiaryId)));
              },
            ),
          ],
        ),
        body: TabBarView(children: [
          renderBodyDetails(),
          renderFragmentForListOfHives(),
        ]),
        drawer: const NavigationDrawer(),
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
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        apiary.name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: "Lato",
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * (1 / 3),
                                padding: const EdgeInsets.all(2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Humidity",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Sun Exposure",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * (1 / 3),
                                padding: const EdgeInsets.all(2),
                                child: Column(
                                  children: [
                                    Text("${apiary.humidity}"),
                                    Text("${apiary.sunExposure}"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    getDescriptionLocationWidget(
                        "Description", apiary.description),
                    getDescriptionLocationWidget("Location", apiary.location)
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  Widget getDescriptionLocationWidget(String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                value,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderFragmentForListOfHives() {
    return FutureBuilder(
      future: getHiveList(apiaryId),
      builder: (context, snapshot) {
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
          List<Hive> hives = (snapshot.data as List<Hive>);
          if (hives.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Center(
                  child: Text(
                    "The apiary does not have any hives!",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "Floating Action Button Was Pressed");
              },
            ),
            body: ListView.builder(
                itemCount: hives.length,
                itemBuilder: (context, id) {
                  Hive hive = hives[id];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                hive.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10,0,0,0),
                              child: Text(hive.description,overflow: TextOverflow.ellipsis,maxLines: 2,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
      },
    );
  }
}

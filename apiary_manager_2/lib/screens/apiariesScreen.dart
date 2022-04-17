import 'dart:convert' as convert;

import 'package:apiary_manager_2/model/ApiaryData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/navigationDrawer.dart';

class ApiariesScreen extends StatefulWidget {
  const ApiariesScreen({Key? key}) : super(key: key);

  @override
  State<ApiariesScreen> createState() => _ApiariesScreenState();
}

class _ApiariesScreenState extends State<ApiariesScreen> {
  int _subScreenState = 0;

  int currentPage = 1;

  List<Apiary> apiaryList = [];

  final controller = ScrollController();

  final List<Widget> _screens = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _subScreenState = index;
    });
  }

  @override
  void initState() {
    super.initState();

    getApiaryData();

    // controller.addListener(() {
    //   if (controller.position.maxScrollExtent == controller.offset) {
    //     getApiaryData();
    //   }
    // });
  }

  Future<List<Apiary>?> getApiaryData() async {
    var url =
        Uri.parse('http://192.168.1.134:8000/api/apiary/list?format=json');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*'
      },
    );
    if (response.statusCode == 200) {
      // var jsonResponse =
      //     convert.jsonDecode(response.body) as Map<String, dynamic>;

       return apiaryFromJson(response.body);

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _screens.add(
      renderBodyListStructure(),
    );
    //getApiaryData();
    _screens.add(
      // Text(apiaryList.toString()),
      Text(""),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Apiary Manager 2'),
      ),
      body: Center(
        child: _screens.elementAt(_subScreenState),
      ),
      drawer: NavigationDrawer(),
      bottomNavigationBar: renderBottomNavigationBar(context),
    );
  }

  Widget renderBodyListStructure() {
    return FutureBuilder(
      future: getApiaryData(),
      builder: ((context, snapshot) {
        if((snapshot.data == null || snapshot.connectionState == ConnectionState.waiting )){
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        print(snapshot);
        apiaryList = snapshot.data as List<Apiary>;
        return ListView.builder(
          itemBuilder: (context, position) {
            // if (apiaryList.isNotEmpty && position < apiaryList.length) {
              final item = apiaryList[position];
              return ListTile(
                title: Text(item.name),
              );
            // } else {
            //   return const Padding(
            //     padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            //     child: Center(
            //       child: CircularProgressIndicator(),
            //     ),
            //   );
            // }
          },
          itemCount: apiaryList.length ,
          // controller: controller,
        );
      }),
    );
  }

  Widget renderBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.crop_square_outlined,
          ),
          label: "Apiaries",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bug_report_outlined,
          ),
          label: "Queens",
        ),
      ],
      onTap: _onItemTapped,
      currentIndex: _subScreenState,
      selectedItemColor: Colors.amber,
    );
  }
}

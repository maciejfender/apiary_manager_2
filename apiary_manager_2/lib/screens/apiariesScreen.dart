import 'dart:convert' as convert;

import 'package:apiary_manager_2/model/ApiaryData.dart';
import 'package:apiary_manager_2/screens/apiaryDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/navigationDrawer.dart';
import '../webApi/apiaryWebService.dart';
import 'createApiaryScreen.dart';

class ApiariesScreen extends StatefulWidget {
  const ApiariesScreen({Key? key}) : super(key: key);

  @override
  State<ApiariesScreen> createState() => _ApiariesScreenState();
}

class _ApiariesScreenState extends State<ApiariesScreen> {
  int _subScreenState = 0;

  int currentPage = 1;

  String title = 'Apiary Manager 2';

  List<Apiary> apiaryList = [];

  final controller = ScrollController();

  final List<Widget> _screens = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _subScreenState = index;
    });
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
        title: Text(title),
      ),
      body: Center(
        child: _screens.elementAt(_subScreenState),
      ),
      drawer: NavigationDrawer(),
      bottomNavigationBar: renderBottomNavigationBar(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: lunchAddApiaryScreen,
      ),
    );
  }

  Widget renderBodyListStructure() {
    return FutureBuilder(
      future: getApiaryList(),
      builder: ((context, snapshot) {
        if ((snapshot.data == null ||
            snapshot.connectionState == ConnectionState.waiting)) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        apiaryList = snapshot.data as List<Apiary>;
        return ListView.builder(
          itemBuilder: (context, position) {
            // if (apiaryList.isNotEmpty && position < apiaryList.length) {
            final item = apiaryList[position];
            return Card(
              child: ListTile(
                title: Text(item.name),
                subtitle: Text(item.getShortDesc()),
                onTap: (){listTileOnTap(item.id);},
              ),
            );
          },
          itemCount: apiaryList.length,
        );
      }),
    );
  }

  void listTileOnTap(int apiaryId){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApiaryDetailsScreen(apiaryId),
      ),
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

  void lunchAddApiaryScreen(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>CreateApiaryScreen(),
      ),
    );
  }
}

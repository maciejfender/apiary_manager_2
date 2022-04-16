import 'package:apiary_manager_2/model/ApiaryData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

  List<ApiaryData> apiaryList = [];

  final List<Widget> _screens = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _subScreenState = index;
    });
  }

  // Future<bool> getApiaryData()async{
  //   Uri uri = Uri.parse("http://localhost:8000/api/apiary/list");
  //
  //   final response = await http.get(uri);
  //   if(response.statusCode == 200){
  //     final result = ApiaryData.parseFromJson(response.body);
  //     return true;
  //   }
  //   else {
  //     return false;
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    _screens.add(
      renderBodyListStructure(),
    );

    _screens.add(
      const Text("123"),
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
    return ListView.builder(
      itemBuilder: (context, position) {
        return ApiaryFragment(context, position);
      },
      itemCount: 10,
    );
  }

  Widget ApiaryFragment(BuildContext context, int position) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
      child: Card(
        child: ListTile(
          leading: Icon(Icons.all_inbox),
          title: Text('The Enchanted Nightingale'),
          subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
        ),
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
          label: "Structure",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.pan_tool_outlined,
          ),
          label: "Equipment",
        ),
      ],
      onTap: _onItemTapped,
      currentIndex: _subScreenState,
      selectedItemColor: Colors.amber,
    );
  }
}

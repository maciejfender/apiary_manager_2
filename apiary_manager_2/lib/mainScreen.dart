import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/navigationDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _subScreenState = 0;

  final List<Widget> _screens = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _subScreenState = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _screens.add(
      renderBody(),
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

  Widget renderBody() {
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

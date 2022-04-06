import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'components/navigationDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apiary Manager 2'),
      ),
      body: Center(
        child: renderBody(context),
      ),
      drawer: NavigationDrawer(),
    );
  }

  Widget renderBody(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return ApiaryFragment(context, position);
      },
      itemCount: 10,
    );
  }

  Widget ApiaryFragment(BuildContext context, int position) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
      child: Card(
        child: InkWell(
          splashColor: Colors.orange[30],
          child: ListTile(
            leading: Icon(Icons.all_inbox),
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
        ),
      ),
    );
  }
}

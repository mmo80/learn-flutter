import 'package:exero_prototype_app/Common/app-text-styles.dart';
import 'package:exero_prototype_app/Pages/add-exercise-page.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  static const String accountName = "Miguel Mendes";
  static const String accountEmail = "testing@example.com";

  ListTile tile(BuildContext context, String label, String routeName) {
    return new ListTile(
      //leading: new CircleAvatar(), // child: new Text(label)
      title: new Text(label, style: AppTextStyles.formElement),
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    List<ListTile> _tiles = [
      tile(context, 'HOME', '/'),
      tile(context, 'ADD EXERCISE', AddExercisePage.routeName),
      tile(context, 'HISTORY', '/'),
      tile(context, 'SETTINGS', '/'),
    ];

    Drawer _drawer = new Drawer(
      child: new Column(
        children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: const Text(accountName),
              accountEmail: const Text(accountEmail),
              decoration: new BoxDecoration(color: const Color(0xFFFF5D73)),
              margin: EdgeInsets.zero,
            ),
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _tiles,
              ),
            )
            ,
        ],
      ),
    );

    return _drawer;
  }
}
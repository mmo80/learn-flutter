import 'package:exero_prototype_app/Common/app-elements.dart';
import 'package:exero_prototype_app/Common/menu-drawer.dart';
import 'package:exero_prototype_app/Pages/add-exercise-page.dart';
import 'package:exero_prototype_app/Pages/start-session-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MenuDrawer(),
      appBar: AppElements.exAppbar(this.title),
      body: new ListView(
        children: <Widget>[
          new MenuButton("START SESSION", StartSessionPage.routeName),
          new MenuButton("ADD EXERCISE", AddExercisePage.routeName),
        ],
      )
    );
  }
}

class MenuButton extends StatelessWidget {
  MenuButton(this.label, this.routeName);

  final String label;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: AppElements.exButton(
          label,
          () { Navigator.of(context).pushNamed(routeName); }
      ),
    );
  }
}
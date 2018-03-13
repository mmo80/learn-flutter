import 'package:exero_prototype_app/Common/app-elements.dart';
import 'package:exero_prototype_app/Common/app-text-styles.dart';
import 'package:exero_prototype_app/Common/menu-drawer.dart';
import 'package:flutter/material.dart';

class StartSessionPage extends StatefulWidget {
  StartSessionPage({Key key, this.title}) : super(key: key);

  final String title;
  static final String routeName = '/startsession';

  @override
  StartSessionPageState createState() => new StartSessionPageState();
}

class StartSessionPageState extends State<StartSessionPage> {

    Widget titleSection = new Container(
      margin: const EdgeInsets.only(bottom: 30.0),
      child: new Text(
          "START SESSION",
          style: AppTextStyles.header
      ),
    );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MenuDrawer(),
      appBar: AppElements.exAppbar(widget.title),
      body: new Container(
        margin: const EdgeInsets.all(16.0),
        child: new ListView(
          children: <Widget>[
            titleSection,
            // more Widgets
          ],
        ),
      ),
    );
  }
}
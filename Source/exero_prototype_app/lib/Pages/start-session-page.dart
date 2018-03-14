import 'package:exero_prototype_app/Common/app-elements.dart';
import 'package:exero_prototype_app/Common/app-text-styles.dart';
import 'package:exero_prototype_app/Common/menu-drawer.dart';
import 'package:flutter/material.dart';

class StartSessionPage extends StatefulWidget {
  StartSessionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  StartSessionPageState createState() => new StartSessionPageState();
}

class StartSessionPageState extends State<StartSessionPage> {

  String partialPage = "start";
  String partialLabel;

  void _ChangePage(String pageName, String label) {
    setState(() {
        partialPage = pageName;
        partialLabel = label;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget topbar = new Container(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text("2018-02-12", style: AppTextStyles.formElement),
          AppElements.exSmallerButton("FINNISH SESSION", null)
        ],
      ),
    );


    Container buildListTile(String exerciseName, String bodyText) {
      return new Container(
        margin: const EdgeInsets.only(top: 10.0),
        //padding: const EdgeInsets.all(15.0),
        decoration: new BoxDecoration(
          color: const Color(0xFFFDF3F5),
          border: new Border.all(
            width: 1.0, 
            color: const Color(0xFFF4CDD4)
            )
        ),
        //width: double.maxFinite,
        child: new MaterialButton(
          //minWidth: double.maxFinite,
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //textDirection: TextDirection.ltr,
            children: <Widget>[
              new Text(exerciseName, style: AppTextStyles.exerciseListHeader),
              new Text(bodyText, style: AppTextStyles.exerciseListText),
            ],
          ),
          onPressed: () {
            _ChangePage("detailed", exerciseName);
            // showDialog(
            //   context: context,
            //   child: new AlertDialog(
            //     title: new Text('What you did'),
            //     content: new Text("You tapped! $exerciseName"),
            //   ),
            // );
          }),
        );
    }


    Widget box = new Column(
      children: <Widget>[
        buildListTile("BENCH PRESS", "12 x 20 kg, 10 x 40 kg, 8 x 50 kg"),
        buildListTile("DUMBBELL PRESS", "12 x 20 kg, 10 x 40 kg, 8 x 50 kg"),
      ],
    );

    Column partial;

    if (partialPage == "start") {
      Widget addButton = AppElements.exButton(
        "ADD EXERCISE", 
        () { null; });

      partial = new Column(
        children: <Widget>[
          addButton,
          box,
        ],
      );
    }
    else if(partialPage == "detailed") {
      partial = new Column(
        children: <Widget>[
          new Text("You tapped $partialLabel!", style: AppTextStyles.formElement),
          new MaterialButton(
            child: new Text("Back"),
            onPressed: () {
              _ChangePage("start", null);
            }),
        ],
      );
    }

    return new Scaffold(
      drawer: new MenuDrawer(),
      appBar: AppElements.exAppbar(widget.title),
      body: new Container(
        margin: const EdgeInsets.all(16.0),
        child: new ListView(
          children: <Widget>[
            topbar,
            new Divider(color: const Color(0xFFDBDBDB)),
            partial,
            // more Widgets
          ],
        ),
      ),
    );
  }
}
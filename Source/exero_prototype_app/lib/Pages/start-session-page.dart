import 'package:exero_prototype_app/Common/app-elements.dart';
import 'package:exero_prototype_app/Common/app-text-styles.dart';
import 'package:exero_prototype_app/Common/menu-drawer.dart';
import 'package:flutter/material.dart';
import 'package:exero_prototype_app/Pages/entities.dart';
import 'package:exero_prototype_app/Pages/workout-exercise-page.dart';

// =============== CLASS : start

class StartSessionPage extends StatefulWidget {
  StartSessionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  StartSessionPageState createState() => new StartSessionPageState();
}

class StartSessionPageState extends State<StartSessionPage> {

  String partialPage = "start";
  String partialLabel;

  void _changePage(Item item) {
    setState(() {
        partialPage = item.pageName;
        partialLabel = item.label;
    });
  }

  List<ExerciseItem> list = [
    new ExerciseItem("1", "BENCH PRESS", "12 x 20 kg, 10 x 40 kg, 8 x 50 kg"),
    new ExerciseItem("2", "DUMBBELL PRESS", "12 x 20 kg, 10 x 40 kg"),
  ];
  

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
        decoration: new BoxDecoration(
          color: const Color(0xFFFDF3F5),
          border: new Border.all(
            width: 1.0, 
            color: const Color(0xFFF4CDD4)
            )
        ),
        child: new MaterialButton(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Text(exerciseName, style: AppTextStyles.exerciseListHeader),
              new Text(bodyText, style: AppTextStyles.exerciseListText),
            ],
          ),
          onPressed: () {
            _changePage(new Item("detailed", exerciseName));
          },
        ),
      );
    }

    Widget partial;

    if (partialPage == "start") {
      partial = new Column(
        children: <Widget>[
          AppElements.exButton("ADD EXERCISE", (){}),
          new Column(
            children: list.map((ExerciseItem i) {
                return buildListTile(i.name, i.note);
              }).toList(),
          ),
        ],
      );
    }
    else if(partialPage == "detailed") {
      partial = new WorkoutExercisePage(
        label: partialLabel, 
        onBack: _changePage
      );
    }

    return new Scaffold(
      drawer: new MenuDrawer(),
      appBar: AppElements.exAppbar(widget.title),
      body: new Container(
        margin: const EdgeInsets.all(8.0),
        child: new ListView(
          shrinkWrap: true,
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

// =============== CLASS : end
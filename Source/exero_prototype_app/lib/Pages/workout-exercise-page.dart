import 'package:flutter/material.dart';
import 'package:exero_prototype_app/Pages/entities.dart';
import 'package:exero_prototype_app/Common/app-text-styles.dart';
import 'package:flutter/services.dart';

// =============== CLASS : start

// class ExDeco extends StatelessWidget {
//   ExDeco({Key key, this.label, this.data}) : super(key: key);

//   String label;
//   final ExerciseSetData data;

//   @override
//   Widget build(BuildContext context) {
//     return new TextFormField(
//           decoration: const InputDecoration(
//             hintText: '...',
//             border: InputBorder.none,
//             labelText: label,//"SET",
//             labelStyle: const TextStyle(fontSize: 14.0),
//           ),
//           style: AppTextStyles.header,
//           keyboardType: TextInputType.number,
//           onSaved: (String value) { data.setNo = value; },
//           inputFormatters: <TextInputFormatter> [
//             WhitelistingTextInputFormatter.digitsOnly,
//           ]);
//   }
// }


class WorkoutExercisePage extends StatefulWidget {
  WorkoutExercisePage({Key key, this.label, this.onBack}) : super(key: key);

  final String label;
  final ValueChanged<Item> onBack;

  @override
  WorkoutExercisePageState createState() => new WorkoutExercisePageState(label: label, onBack: onBack);
}

class WorkoutExercisePageState extends State<WorkoutExercisePage> {
  WorkoutExercisePageState({this.label, this.onBack});

  final String label;
  final ValueChanged<Item> onBack;

  void _handleBack() {
    onBack(new Item("start", null));
  }

  ExerciseSetData data = new ExerciseSetData();

  Widget box(Widget field, {double width: 64.0, double height: 62.0}) {
    return new Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.only(left: 10.0),
      decoration: new BoxDecoration(
        color: const Color(0xFFFDF3F5),
        border: new Border(
          right: const BorderSide(width: 1.0, color: const Color(0xFFFDF3F5)),
          top: const BorderSide(width: 1.0, color: const Color(0xFFCBC6C7)),
          left: const BorderSide(width: 1.0, color: const Color(0xFFCBC6C7)),
          bottom: const BorderSide(width: 1.0, color: const Color(0xFFFDF3F5)),
          )
      ),
      child: field,
    );
  }

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    const TextStyle _fontSize = const TextStyle(fontSize: 14.0, color: Colors.black);

    var _firstRow = new Row(
      children: <Widget>[
        box(new TextFormField(
          decoration: const InputDecoration(labelText: "SET", border: InputBorder.none, labelStyle: _fontSize),
          style: AppTextStyles.header,
          keyboardType: TextInputType.number,
          onSaved: (String value) { data.setNo = value; },
          inputFormatters: <TextInputFormatter> [
            WhitelistingTextInputFormatter.digitsOnly,
          ])
        ),
        box(new TextFormField( // CBC6C7
          decoration: const InputDecoration(labelText: "REP", border: InputBorder.none, labelStyle: _fontSize),
          style: AppTextStyles.header,
          keyboardType: TextInputType.number,
          onSaved: (String value) { data.reps = value; },
          inputFormatters: <TextInputFormatter> [
            WhitelistingTextInputFormatter.digitsOnly,
          ])
        ),
        box(new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: <Widget>[
              new Text("x  ", style: AppTextStyles.header,)
          ]),
          width: 30.0
        ),
        box(new TextFormField(
          decoration: const InputDecoration(labelText: "WEIGHT", border: InputBorder.none, labelStyle: _fontSize),
          style: AppTextStyles.header,
          keyboardType: TextInputType.number,
          onSaved: (String value) { data.weight = value; },
          inputFormatters: <TextInputFormatter> [
            WhitelistingTextInputFormatter.digitsOnly,
          ]),
          width: 70.0
        ),
        box(new TextFormField(
          decoration: const InputDecoration(labelText: "UNIT", border: InputBorder.none, labelStyle: _fontSize),
          style: AppTextStyles.header,
          keyboardType: TextInputType.text,
          onSaved: (String value) { data.unit = value; },
          )
        ),
      ],
    );

    var _secondRow = new Row(
      children: <Widget>[
        box(new TextFormField(
          decoration: const InputDecoration(labelText: "W", border: InputBorder.none, labelStyle: _fontSize),
          style: AppTextStyles.header,
          keyboardType: TextInputType.text,
          onSaved: (String value) { data.warmup = true/*value*/; },
          )
        ),
        box(new TextFormField(
          decoration: const InputDecoration(labelText: "D", border: InputBorder.none, labelStyle: _fontSize),
          style: AppTextStyles.header,
          keyboardType: TextInputType.text,
          onSaved: (String value) { data.dropSet = true/*value*/; },
          )
        ),
        box(new TextFormField(
          decoration: const InputDecoration(labelText: "REST TIMER", border: InputBorder.none, labelStyle: _fontSize),
          style: AppTextStyles.header,
          keyboardType: TextInputType.text,
          onSaved: (String value) { data.dropSet = true/*value*/; },
          ),
          width: 164.0
        ),
      ],
    );

    var _top = new Container(
      margin: const EdgeInsets.only(top: 5.0, bottom: 12.0),
      child: new Row(
      children: <Widget>[
        new Flexible(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Text("Chest", style: AppTextStyles.formElement),
              new Text(label, style: AppTextStyles.header) 
            ],
          ),
        ),
        new Icon(Icons.arrow_drop_down_circle, size: 34.0, color: const Color(0xFFFF5D73),)
      ],
    ),
    );

    var _form = new Form(
      key: _formKey,
      child: new Column(
        children: <Widget>[
          _firstRow,
          _secondRow,
        ],
      ),
    );


    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _top,
        //new Divider(color: const Color(0xFFDBDBDB)),
        _form,
        new MaterialButton(
          child: new Text("BACK"),
          onPressed: () {
            _handleBack();
          }),
      ],
    );

  }
}

// =============== CLASS : end
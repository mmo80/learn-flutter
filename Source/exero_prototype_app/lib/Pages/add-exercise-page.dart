import 'package:exero_prototype_app/Common/app-elements.dart';
import 'package:exero_prototype_app/Common/app-text-styles.dart';
import 'package:exero_prototype_app/Common/menu-drawer.dart';
import 'package:flutter/material.dart';


class AddExercisePage extends StatefulWidget {
  AddExercisePage({Key key, this.title}) : super(key: key);

  final String title;
  static final String routeName = '/addexercise';

  @override
  AddExercisePageState createState() => new AddExercisePageState();
}

class AddExercisePageState extends State<AddExercisePage> {
  String _categoryValue = 'Choose...';
  String _typeValue;
  final TextEditingController _controller = new TextEditingController();
  List<String> _categoryList = ['Choose...','Strength', 'Conditioning'];
  List<String> _strengthList = ['Chest', 'Biceps', 'Shoulders', 'Triceps'];
  List<String> _conditioningList = ['Running', 'Trail running'];
  List<String> _typeList = new List();

  Widget _item(String value) {
    return new DropdownMenuItem<String>(
        value: value,
        child: new Container(
          //width: 250.0,
          child: new Text(value, textAlign: TextAlign.left,),
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget titleSection = new Container(
      margin: const EdgeInsets.only(bottom: 30.0),
      child: new Text(
          "ADD EXERCISE",
          style: AppTextStyles.header
      ),
    );

    Widget categorySection = new Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      width: double.INFINITY,
      child: new DropdownButton(
        style: AppTextStyles.formElement,
        value: _categoryValue,
        items: _categoryList.map((String value) {
          return _item(value);
        }).toList(),
        onChanged: (String newValue) {
          // null indicates the user didn't select a
          // new value.
          setState(() {
            _typeValue = null;
            if (newValue != null){
              _categoryValue = newValue;
              _typeList.clear();
              switch(_categoryValue) {
                case "Strength":
                  _typeList.addAll(_strengthList);
                  _typeValue = _strengthList[0];
                  break;
                case "Conditioning":
                  _typeList.addAll(_conditioningList);
                  _typeValue = _conditioningList[0];
                  break;
              }
            }

          });
        },
      ),
    );

    Widget typeSection = new Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      child: new DropdownButton<String>(
        style: AppTextStyles.formElement,
        hint: new Text("Choose Category"),
        value: _typeValue,
        items: (_typeList.isNotEmpty) ? _typeList.map((String value) {
          return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value));
        }).toList()
            : <String>['empty'].map((String value) {
          return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value));
        }).toList(),
        onChanged: (String newValue) {
          setState(() {
            if (newValue != null)
              _typeValue = newValue;
          });
        },
      ),
    );

    Widget textSection = new Container(
      margin: const EdgeInsets.only(bottom: 38.0),
      child: new TextField(
        style: AppTextStyles.formElement,
        controller: _controller,
        decoration: new InputDecoration(
          hintText: 'Exercise Name...',
        ),
      ),
    );

    Widget btnSection = AppElements.exButton('ADD EXERCISE', () {
      showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('What you typed'),
          content: new Text("Category: $_categoryValue, Type: $_typeValue, Name: " + _controller.text),
        ),
      );
    });

    return new Scaffold(
      drawer: new MenuDrawer(),
      appBar: AppElements.exAppbar(widget.title),
      body: new Container(
        margin: const EdgeInsets.all(16.0),
        child: new ListView(
          children: <Widget>[
            titleSection,
            categorySection,
            typeSection,
            textSection,
            btnSection,
            // more Widgets
          ],
        ),
      ),
    );
  }
}
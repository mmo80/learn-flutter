import 'package:exero_prototype_app/Common/app-routes.dart';
import 'package:exero_prototype_app/Pages/add-exercise-page.dart';
import 'package:exero_prototype_app/Pages/start-session-page.dart';
import 'package:exero_prototype_app/Pages/home-page.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final String _header = "Exero";

    return new MaterialApp(
      title: 'Exero Prototype',
      //debugShowMaterialGrid: true,
      theme: new ThemeData(
        primaryColor: const Color(0xFF494949),
      ),
      home: new HomePage(title: _header),
      routes: <String, WidgetBuilder> {
        AppRoutes.startSession: (BuildContext context) => new StartSessionPage(title: _header),
        AppRoutes.addExercise: (BuildContext context) => new AddExercisePage(title: _header),
      },
    );
  }
}



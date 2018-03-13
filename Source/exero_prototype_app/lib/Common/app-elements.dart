import 'package:exero_prototype_app/Common/app-text-styles.dart';
import 'package:flutter/material.dart';

class AppElements {
  static Widget exButton(String label, void onPress()) {
    return new Container(
      width: double.INFINITY,
      alignment: Alignment.center,
      color: const Color(0xFFFF5D73),
      child: new MaterialButton(
        padding: const EdgeInsets.all(16.0),
        minWidth: double.INFINITY,
        child: new Text(
          label,
          style: AppTextStyles.button,
        ),
        onPressed: onPress,
      ),
    );
  }

  static Widget exAppbar(String title) {
    return new AppBar(
          title: new Text(title, style: AppTextStyles.appBar,),
        );
  }
}
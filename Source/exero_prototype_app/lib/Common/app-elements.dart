import 'package:exero_prototype_app/Common/app-text-styles.dart';
import 'package:flutter/material.dart';

class AppElements {

  static Widget exButton(String label, void onPress()) {
    return new Container(
      alignment: Alignment.center,
      color: const Color(0xFFFF5D73),
      child: new MaterialButton(
        minWidth: double.maxFinite,
        padding: const EdgeInsets.all(16.0),
        child: new Text(
          label,
          style: AppTextStyles.button,
        ),
        onPressed: onPress,
      ),
    );
  }

  static Widget exSmallerButton(String label, void onPress()) {
    return new Container(
      alignment: Alignment.center,
      color: const Color(0xFFFF5D73),
      child: new MaterialButton(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 10.0, top: 10.0), // 16.0
        child: new Text(
          label,
          style: AppTextStyles.smallerButton,
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
import 'package:flutter/material.dart';

class MyColors extends InheritedWidget {
  MyColors({
    Key key,
    this.child,
    this.color1,
    this.color2,
  }) : super(key: key, child: child);

  final Widget child;
  final Color color1;
  final Color color2;

  static MyColors of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyColors>();
  }

  @override
  bool updateShouldNotify(MyColors oldWidget) {
    return color1 != oldWidget.color1 || color2 != oldWidget.color2;
  }
}

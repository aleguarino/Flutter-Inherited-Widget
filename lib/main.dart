import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget/model/MyColors.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color color1 = Colors.green;
  Color color2 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MyColors(
      color1: color1,
      color2: color2,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SquareWidget(),
              SquareWidget2(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              color1 = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0);
              color2 = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0);
            });
          },
          child: Icon(Icons.radio),
        ),
      ),
    );
  }
}

class SquareWidget extends StatelessWidget {
  const SquareWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _myColorsW = context.dependOnInheritedWidgetOfExactType<MyColors>();
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: _myColorsW.color1,
      ),
    );
  }
}

class SquareWidget2 extends StatelessWidget {
  const SquareWidget2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _myColorsW = context.dependOnInheritedWidgetOfExactType<MyColors>();
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: _myColorsW.color2,
      ),
    );
  }
}

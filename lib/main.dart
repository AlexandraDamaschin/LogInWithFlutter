import 'package:flutter/material.dart';

// Define in order to render something on the screen
void main() => runApp(MyApp());

// Widget the root of the widget tree
// Renders the widget, along with its children into the screen
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

///Stateful widget = will contain fields that affect how it looks
//home page of the application
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

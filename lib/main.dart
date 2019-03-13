import 'package:flutter/material.dart';
import 'package:login_app/services.dart';

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

// Define MyHomePage widget state
class _MyHomePageState extends State<MyHomePage> {
  TextStyle customStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final =  object value won’t be modified throughout the app
    final emailField = TextField(
      controller: myController,
      obscureText: false,
      style: customStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Email',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      controller: myController2,
      //to hide input as we are typing set obscureText: true
      obscureText: false,
      style: customStyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          var response = fetchPost();
          return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  //content: Text(myController2.text),
                  content: Text(response.toString()),
                );
              });
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: customStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    //All these widgets together inside our Scaffold widget.
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                //SizedBox widget for spacing purposes
                SizedBox(
                  height: 45.0,
                ),
                emailField,
                SizedBox(
                  height: 25.0,
                ),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButton,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

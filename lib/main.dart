import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  // visualització bàsica de l'app
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Home(
        key: UniqueKey(),
      ),
    );
  }
}


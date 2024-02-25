import 'package:flutter/material.dart';
import 'screens/home.dart';

// main() -> permet l'inici de l'execució de l'app
void main() => runApp(App());

class App extends StatelessWidget {

  // construeix visualització bàsica de l'app
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


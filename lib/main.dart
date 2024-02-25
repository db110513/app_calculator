import 'package:flutter/material.dart';
import 'screens/home.dart';

// no explico la lògica de l'app ja que sinó el video seria massa llarg

// main() -> permet l'inici de l'execució de l'app
void main() => runApp(App());

// StatelessWidget -> mostra l'aparená que no varia
class App extends StatelessWidget {

  // construeix visualització bàsica de l'app
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // mostra la pantalla anomenada Home que es troba a l'arxiu home.dart
      home: Home(
        key: UniqueKey(),
      ),
    );
  }
}


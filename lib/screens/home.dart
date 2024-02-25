import 'package:flutter/material.dart';

// StatefulWidget -> dinàmic ja que l'app canvia a l'apretar els botons
class Home extends StatefulWidget {

  Home({required Key key}) : super(key: key);

  _HomeState createState() => new _HomeState();

}

class _HomeState extends State<Home> {

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String op = "";

  // mètode encarregat de realitzar les operacions matemàtiques / * + -
  clickButton(String buttonText) {

    if (buttonText == "AC") {

      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      op = "";

    }

    else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*") {

      num1 = double.parse(output);

      op = buttonText;

      _output = "0";

    }

    else if (buttonText == ".") {

      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      }

      else {
        _output = _output + buttonText;
      }

    }

    else if (buttonText == "=") {

      num2 = double.parse(output);

      if (op == "+") {
        _output = (num1 + num2).toString();
      }
      else if (op == "-") {
        _output = (num1 - num2).toString();
      }
      else if (op == "*") {
        _output = (num1 * num2).toString();
      }
      else {
        _output = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      op = "";

    }

    else {

      _output = _output + buttonText;

    }

    print(_output);

    setState(() => output = double.parse(_output).toStringAsFixed(0));

  }

  // crea el widget que permet la visualització dels números dels botons i
  // també deñ resultat de realitzar les operacions
  Widget buildButton(String button) {

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: OutlinedButton(
          onPressed: () => clickButton(button),
          child: Text(
            button,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // widget que mostra per pantalla les tecles de la calculadora
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 150),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 12
                    ),
                    child: Text(output,
                        style: TextStyle(
                          fontSize: 66,
                          fontWeight: FontWeight.bold,
                        )
                    )
                ),


                Column(children: [
                  Row(
                      children: [
                        buildButton("7"),
                        buildButton("8"),
                        buildButton("9"),
                        buildButton("/")
                      ]
                  ),

                  Row(
                      children: [
                        buildButton("4"),
                        buildButton("5"),
                        buildButton("6"),
                        buildButton("*")
                      ]
                  ),

                  Row(
                      children: [
                        buildButton("1"),
                        buildButton("2"),
                        buildButton("3"),
                        buildButton("-")
                      ]
                  ),

                  Row(
                      children: [
                        buildButton("0"),
                        buildButton("·"),
                        buildButton("+")
                      ]
                  ),

                  Row(
                      children: [
                        buildButton("AC"),
                        buildButton("="),
                      ]
                  )

                ])
              ],
            )
        )
    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {

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

  buttonPressed(String buttonText) {

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
      if (op == "-") {
        _output = (num1 - num2).toString();
      }
      if (op == "*") {
        _output = (num1 * num2).toString();
      }
      if (op == "/") {
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

  Widget buildButton(String button) {

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: OutlinedButton(
          onPressed: () => buttonPressed(button),
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


  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 12.0
                    ),
                    child: Text(output, style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,

                    ))),
                Expanded(
                  child: Divider(),
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
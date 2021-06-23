
// ignore: avoid_web_libraries_in_flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Calculator(),
  ));
}
class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
                color: Colors.white,
                width: 1.5,
                style: BorderStyle.solid
            )
        ),
        padding: EdgeInsets.all(18.0),
        onPressed: null,
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[400],
      appBar: AppBar(
        title: Text('CALCULATOR'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 15.0,

      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(15, 25, 25, 0),
            child: Text(
              "0",
              style: TextStyle(fontSize: 40,),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C", 1.0, Colors.redAccent),
                        buildButton("X", 1.0, Colors.lightBlue),
                        buildButton("+", 1.0, Colors.lightBlue),


                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("1", 1.0, Colors.grey),
                        buildButton("2", 1.0, Colors.grey),
                        buildButton("3", 1.0, Colors.grey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("4", 1.0, Colors.grey),
                        buildButton("5", 1.0, Colors.grey),
                        buildButton("6", 1.0, Colors.grey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("7", 1.0, Colors.grey),
                        buildButton("8", 1.0, Colors.grey),
                        buildButton("9", 1.0, Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *80,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("8", 1.0, Colors.grey),
                      ]
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

// Result Display Bar




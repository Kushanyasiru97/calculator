
// ignore: avoid_web_libraries_in_flutter
import 'package:math_expressions/math_expressions.dart';
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

  String equation="0";
  String result = "0";
  String expression ="";
  double equationFontSize=40.0;
  double resultFontSize=50.0;
  buttonPressed(String buttonText){
    setState(() {
      if (buttonText == "C"){
        equation="0";
        result="0";
        equationFontSize=40.0;
        resultFontSize=50.0;
      }
      else if(buttonText == "⌫"){
        equationFontSize=40.0;
        resultFontSize=50.0;
        equation=equation.substring(0, equation.length -1);
        if(equation ==""){
          equation="0";
        }
      }

      else if(buttonText == "⁼"){
        equationFontSize=40.0;
        resultFontSize=50.0;

        expression = equation;
        expression =expression.replaceAll("×", "*");
        expression =expression.replaceAll("÷", "/");
        try{
          Parser p= Parser();
          Expression exp= p.parse(expression);

          ContextModel cm = ContextModel();
          result= '${exp.evaluate(EvaluationType.REAL,cm)}';
        }
        catch(e){
          result="Error";
        }
      }
      else {
        equationFontSize=40.0;
        resultFontSize=50.0;
        if(equation =="0") {
          equation = buttonText;
        }
        else{
          equation = equation+buttonText;
        }

      }
    }
    );
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      // ignore: deprecated_member_use
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
        onPressed: ()  => buttonPressed(buttonText),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('CALCULATOR'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 15.0,

      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(15, 25, 25, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(15, 35, 15, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
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
                        buildButton("⌫", 1.0, Colors.lightBlue),
                        buildButton("÷", 1.0, Colors.lightBlue),


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
                    TableRow(
                      children: [
                        buildButton("∙", 1.0, Colors.grey),
                        buildButton("0", 1.0, Colors.grey),
                        buildButton("00", 1.0, Colors.grey),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("×", 1.0, Colors.lightBlue),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("-", 1.0, Colors.lightBlue),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("+", 1.0, Colors.lightBlue),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("⁼", 2.0, Colors.green),
                        ]
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width *.25,
              )
            ],
          )
        ],
      ),
    );
  }
}

// Result Display Bar




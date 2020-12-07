import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = '0';

  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

   buttonpress(String name) {
    if (name == 'Clear') {
      _output = '0';
      
       num1 = 0.0;
       num2 = 0.0;
       operand = '';
    } else if (name == '+' || name == '-' || name == '*' || name == '/') {
      num1 = double.parse(output);
      operand = name;
      _output = '0';
    } else if (name == '.') {
      if (_output.contains('.')) {
        print('already contains a decimal');
        return;
      } else {
        _output = _output + name;
      }
    } else if (name == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == '*') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = '0';
    } else {
      _output += name;
    }
    print(_output);
    setState(() {
      output =double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget button({
    @required String name,
  }) {
    return Expanded(
      
      child: Container(
        margin: EdgeInsets.only(bottom: 4,left: 4),
        child: OutlineButton(
          padding: EdgeInsets.all(14.0),

          onPressed: () {
            buttonpress(name);
          },

          child: Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.white,
            )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                child: Text(
                  output,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                )),
            Expanded(child: Divider()),
            Column(
              children: [
                Row(
                  children: [
                    button(name: '7'),
                    button(name: '8'),
                    button(name: '9'),
                    button(name: '/'),
                  ],
                ),
                Row(
                  children: [
                    button(name: '4'),
                    button(name: '5'),
                    button(name: '6'),
                    button(name: '*'),
                  ],
                ),
                Row(
                  children: [
                    button(name: '3'),
                    button(name: '2'),
                    button(name: '1'),
                    button(name: '-'),
                  ],
                ),
                Row(
                  children: [
                    button(name: '.'),
                    button(name: '0'),
                    button(name: '00'),
                    button(name: '+'),
                  ],
                ),
                Row(
                  children: [
                    button(name: 'Clear'),
                    button(name: '='),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

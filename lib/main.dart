import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ryans Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _result = '';

  void _addToExpression(String value) {
    setState(() {
      _expression += value;
    });
  }

  void _clearExpression() {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  void _calculateResult() {
    try {
      final expression = Expression.parse(_expression);
      final evaluator = const ExpressionEvaluator();
      final result = evaluator.eval(expression, {});
      setState(() {
        _result = result.toString();
      });
    } catch (e) {
      setState(() {
        _result = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ryans Calculator'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            child: Text(
              _expression.isEmpty ? 'Enter an expression' : _expression,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            child: Text(
              _result.isEmpty ? 'Result' : _result,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                CalculatorButton(
                  text: '7',
                  onPressed: () {
                    _addToExpression('7');
                    _calculateResult();
                  },
                ),
                CalculatorButton(
                  text: '8',
                  onPressed: () {
                    _addToExpression('8');
                    _calculateResult();
                  },
                ),
                CalculatorButton(
                  text: '9',
                  onPressed: () {
                    _addToExpression('9');
                    _calculateResult();
                  },
                ),
                CalculatorButton(
                  text: '/',
                  onPressed: () => _addToExpression('/'),
                ),
                CalculatorButton(
                  text: '4',
                  onPressed: () {
                    _addToExpression('4');
                    _calculateResult();
                  },
                ),
                CalculatorButton(
                  text: '5',
                  onPressed: () {
                    _addToExpression('5');
                    _calculateResult();
                  },
                ),
                CalculatorButton(
                  text: '6',
                  onPressed: () {
                    _addToExpression('6');
                    _calculateResult();
                  },
                ),
                CalculatorButton(
                  text: '*',
                  onPressed: () => _addToExpression('*'),
                ),
                CalculatorButton(
                  text: '1',
                  onPressed: (){
                    _addToExpression('1');
                    _calculateResult();
                  },
                ),
                CalculatorButton(
                  text: '2',
                  onPressed: () {
                    _addToExpression('2');
                    _calculateResult();
                  },
                ),
                CalculatorButton(
                  text: '3',
                  onPressed: () {
                    _addToExpression('3');
                    _calculateResult();
                  },
                ),
                CalculatorButton(
                  text: '-',
                  onPressed: () => _addToExpression('-'),
                ),
                CalculatorButton(
                  text: '0',
                    onPressed: () {
                    _addToExpression('0');
                    _calculateResult();
                    },
                ),
                CalculatorButton(
                  text: '.',
                  onPressed: () => _addToExpression('.'),
                ),
                CalculatorButton(
                  text: '=',
                  onPressed: _calculateResult,
                ),
                CalculatorButton(
                  text: '+',
                  onPressed: () => _addToExpression('+'),
                ),
                CalculatorButton(
                  text: '%',
                  onPressed: () => _addToExpression('%'),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: _clearExpression,
              child: Text('C'),
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double size; // Add the size variable

  const CalculatorButton({
    required this.text,
    required this.onPressed,
    this.size = 32.0, // Set a default value for the size
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: size), // Use the size variable for font size
      ),
    );
  }
}

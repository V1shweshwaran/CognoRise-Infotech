import 'package:flutter/material.dart';
import 'calculaot_logic.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() {
    return _Calculator();
  }
}

class _Calculator extends State<Calculator> {
  final CalculatorLogic _logic = CalculatorLogic();

  void _onButtonPressed(String value) {
    setState(() {
      _logic.input(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(15),
            child: Text(
              _logic.display,
              style: const TextStyle(fontSize: 70),
            ),
          ),
          const Divider(height: 30),
          _buildButtonRow(['7', '8', '9', '+']),
          _buildButtonRow(['4', '5', '6', '-']),
          _buildButtonRow(['1', '2', '3', '*']),
          _buildButtonRow(['C', '.', '=', '/']),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: buttons.map(
            (String value) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColorLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => _onButtonPressed(value),
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).primaryColorDark),
                    ),
                  ),
                ),
              );
            },
          ).toList()),
    );
  }
}

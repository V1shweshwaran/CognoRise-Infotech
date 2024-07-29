import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      home: const BMIcalc(),
    ),
  );
}

class BMIcalc extends StatefulWidget {
  const BMIcalc({super.key});
  @override
  State<BMIcalc> createState() {
    return _BMIcalc();
  }
}

class _BMIcalc extends State<BMIcalc> {
  final _formkey = GlobalKey<FormState>();
  final _WeightController = TextEditingController();
  final _HeightController = TextEditingController();
  double? _bmi;
  String? _classification;

  void calculateBMI() {
    double weight = double.parse(_WeightController.text);
    double height = double.parse(_HeightController.text) / 100;
    setState(() {
      _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _classification = "Under Weight";
      } else if (_bmi! >= 18.5 && _bmi! < 25) {
        _classification = "Normal Weight";
      } else if (_bmi! >= 25 && _bmi! < 29) {
        _classification = "Over Weight";
      } else {
        _classification = "Obesity";
      }
      _HeightController.clear();
      _WeightController.clear();
    });

    _showBMIResult();
  }

  void _showBMIResult() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).primaryColorLight,
            title: const Text('Your BMI'),
            content: Text(
              'Your BMI : ${_bmi!.toStringAsFixed(1)}\nClassification: $_classification',
              style: const TextStyle(fontSize: 20),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
          backgroundColor: Theme.of(context).primaryColorLight,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _WeightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'weight in KGs'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your Weight";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _HeightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Height in CMs'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your Weight";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      calculateBMI();
                    }
                  },
                  child: const Text('Calculate BMI'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _HeightController.dispose();
    _WeightController.dispose();
    super.dispose();
  }
}

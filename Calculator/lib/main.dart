import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 120, 4, 4))),
      home: const Calculator(),
    ),
  );
}

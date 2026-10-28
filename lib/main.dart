import 'package:calc_test/screens/calculadora_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Teste',
      debugShowCheckedModeBanner: false,
      home: const CalculadoraScreen(),
    );
  }
}
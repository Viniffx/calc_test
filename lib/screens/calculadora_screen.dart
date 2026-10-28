import 'package:calc_test/services/calculadora_service.dart';
import 'package:flutter/material.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  State<CalculadoraScreen> createState() =>
      _CalculadoraScreenState();
}

class _CalculadoraScreenState
    extends State<CalculadoraScreen> {

  final numero1Controller = TextEditingController();
  final numero2Controller = TextEditingController();

  final calculadora = CalculadoraService();

  String resultado = 'Resultado:';

  void calcular(String operacao) {

    final texto1 = numero1Controller.text.trim();
    final texto2 = numero2Controller.text.trim();

    if (texto1.isEmpty || texto2.isEmpty) {
      setState(() {
        resultado = 'Preencha os dois campos';
      });
      return;
    }

    final numero1 = double.tryParse(
      texto1.replaceAll(',', '.'),
    );

    final numero2 = double.tryParse(
      texto2.replaceAll(',', '.'),
    );

    if (numero1 == null || numero2 == null) {
      setState(() {
        resultado = 'Digite números válidos';
      });
      return;
    }

    try {
      double valor;

      switch (operacao) {
        case 'somar':
          valor = calculadora.somar(numero1, numero2);
          break;

        case 'subtrair':
          valor = calculadora.subtrair(numero1, numero2);
          break;

        case 'multiplicar':
          valor = calculadora.multiplicar(numero1, numero2);
          break;

        case 'dividir':
          valor = calculadora.dividir(numero1, numero2);
          break;

        default:
          return;
      }

      setState(() {
        resultado = 'Resultado: $valor';
      });

    } on ArgumentError catch (erro) {
      setState(() {
        resultado = erro.message.toString();
      });
    }
  }

  @override
  void dispose() {
    numero1Controller.dispose();
    numero2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Testes'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              key: const Key('campoNumero1'),
              controller: numero1Controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Primeiro número',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              key: const Key('campoNumero2'),
              controller: numero2Controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Segundo número',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [

                ElevatedButton(
                  key: const Key('botaoSomar'),
                  onPressed: () => calcular('somar'),
                  child: const Text('Somar'),
                ),

                ElevatedButton(
                  key: const Key('botaoSubtrair'),
                  onPressed: () => calcular('subtrair'),
                  child: const Text('Subtrair'),
                ),

                ElevatedButton(
                  key: const Key('botaoMultiplicar'),
                  onPressed: () => calcular('multiplicar'),
                  child: const Text('Multiplicar'),
                ),

                ElevatedButton(
                  key: const Key('botaoDividir'),
                  onPressed: () => calcular('dividir'),
                  child: const Text('Dividir'),
                ),

              ],
            ),

            const SizedBox(height: 30),

            Text(
              resultado,
              key: const Key('textoResultado'),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
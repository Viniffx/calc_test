import 'package:calc_test/services/calculadora_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final calculadora = CalculadoraService();

  group('CalculadoraService', () {
    test('Deve somar dois numeros', () {
      expect(calculadora.somar(10, 5), 15);
    });

    test('Deve subtrair dois numeros', () {
      expect(calculadora.subtrair(10, 5), 5);
    });

    test('Deve multiplicar dois numeros', () {
      expect(calculadora.multiplicar(10, 5), 50);
    });

    test('Deve dividir dois numeros', () {
      expect(calculadora.dividir(10, 5), 2);
    });

    test('Deve lançar exceção ao dividir por zero', () {
      expect(() => calculadora.dividir(10, 0), throwsException);
    });
  });

    
}
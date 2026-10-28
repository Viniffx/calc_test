class CalculadoraService {
  double somar(double a, double b) {
    return a + b;
  }
  double subtrair(double a, double b) {
    return a - b;
  }
  double multiplicar(double a, double b) {
    return a * b;
  }
  double dividir(double a, double b) {
    if (b == 0) {
      throw Exception('Divisão por zero não é permitida.');
    }
    return a / b;
  }
}
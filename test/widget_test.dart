// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calc_test/main.dart';

void main() {
  testWidgets('calculates the sum of two numbers', (WidgetTester tester) async {
    await tester.pumpWidget(const MeuAplicativo());

    expect(find.byKey(const Key('botaoSomar')), findsOneWidget);
    expect(find.byKey(const Key('botaoSubtrair')), findsOneWidget);
    expect(find.byKey(const Key('botaoMultiplicar')), findsOneWidget);
    expect(find.byKey(const Key('botaoDividir')), findsOneWidget);

    await tester.enterText(find.byKey(const Key('campoNumero1')), '2');
    await tester.enterText(find.byKey(const Key('campoNumero2')), '3');
    await tester.tap(find.byKey(const Key('botaoSomar')));
    await tester.pump();

    expect(find.text('Resultado: 5.0'), findsOneWidget);
  });
}

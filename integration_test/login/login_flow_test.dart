import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rental_of_vehicle/main.dart' as app;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login Flow Test', () {
    final results = [];
    final frameTimings = <FrameTiming>[];

    WidgetsBinding.instance.addTimingsCallback((timing) {
      frameTimings.addAll(timing);
    });

    setUp(() {
      SharedPreferences.setMockInitialValues({'first_use': true});
    });

    testWidgets('Testa o fluxo de login', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final stopWatch = Stopwatch()..start();

      // Verifica se o botão "Próximo" está presente e interage com ele
      expect(find.text('Próximo'), findsOneWidget);
      await tester.tap(find.text('Próximo'));
      await tester.pumpAndSettle();

      // Verifica se o botão "Entrar" está presente e interage com ele
      expect(find.text('Entrar'), findsOneWidget);
      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      // Verifica se a navegação foi para a rota de login
      expect(find.byType(Navigator), findsOneWidget);
      expect(find.text('Olá!'),
          findsOneWidget); // Verifica o texto da tela de login

      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, 'usuario@test.com');

      final passwordField = find.byType(TextFormField).last;
      await tester.enterText(passwordField, 'senha123');

      final loginButton = find.text('ENTRAR');
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      expect(find.text('Meus Dados'), findsOneWidget);

      stopWatch.stop();

      results.add({
        'tempo_total_ms': stopWatch.elapsedMilliseconds,
        'frames': frameTimings.length
      });

      // gera relatório

      final report = {
        'fluxo': 'login',
        'mínimo': results
            .map((r) => r['tempo_total_ms'])
            .reduce((a, b) => a < b ? a : b),
        'média':
            results.map((r) => r['tempo_total_ms']).reduce((a, b) => a + b) /
                results.length,
        'máximo': results
            .map((r) => r['tempo_total_ms'])
            .reduce((a, b) => a > b ? a : b),
        'detalhes': results
      };

      print('Relatório de desempenho do fluxo de login: ${report}');
    });
  });
}

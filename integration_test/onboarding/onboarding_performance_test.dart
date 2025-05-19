import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rental_of_vehicle/main.dart' as app;
import 'dart:io';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Onboarding Render Time Test', () {
    final results = [];
    final frameTimings = <FrameTiming>[];

    WidgetsBinding.instance.addTimingsCallback((timing) {
      frameTimings.addAll(timing);
    });

    setUp(() {
      SharedPreferences.setMockInitialValues({'first_use': true});
    });

    testWidgets('Mede tempo de renderização (5 execuções)',
        (WidgetTester tester) async {
      for (int i = 0; i < 1; i++) {
        app.main();
        await tester.pumpAndSettle();

        final stopWatch = Stopwatch()..start();

        // Verifica se o botão "Próximo" está presente e interage com o elemento
        expect(find.text('Próximo'), findsOneWidget);
        await tester.tap(find.text('Próximo'));
        await tester.pumpAndSettle();
        print('AQUII');

        // Navega oara a próxima página
        await tester.drag(find.byType(PageView), const Offset(-400, 0));
        await tester.pumpAndSettle();

        // Verifica se o botão "Entrar" está presente e interage com o elemento
        expect(find.text('Entrar'), findsOneWidget);
        await tester.tap(find.text('Entrar'));
        await tester.pumpAndSettle();

        stopWatch.stop();

        results.add({
          'execução': i + 1,
          'tempo_total_ms': stopWatch.elapsedMilliseconds,
          'frames': frameTimings.length
        });

        // reinicia para próxima execução
        await tester.binding.pump(Duration(seconds: 3));

        // gera o relatório
        final report = {
          'fluxo': 'onboarding',
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

        print('Relatório de desempenho do onboarding: ${report}');
        // await File('integration_test/onboarding/render_time_report.json')
        //     .writeAsString(jsonEncode(report));
      }
    });
  });
}

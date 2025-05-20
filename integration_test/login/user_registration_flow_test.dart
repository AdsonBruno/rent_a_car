import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rental_of_vehicle/views/widgets/button/radio_button_group_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rental_of_vehicle/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Fluxo para usuário sem cadastro', () {
    final results = [];
    final frameTimings = <FrameTiming>[];

    WidgetsBinding.instance.addTimingsCallback((timing) {
      frameTimings.addAll(timing);
    });

    setUp(() {
      SharedPreferences.setMockInitialValues({'first_use': true});
    });

    testWidgets('Fluxo para usuário sem cadastro', (WidgetTester tester) async {
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

      //Passo 1: navega até o cadastro de usuário
      expect(find.text('AINDA NÃO TENHO CADASTRO'), findsOneWidget);
      await tester.tap(find.text('AINDA NÃO TENHO CADASTRO'));
      await tester.pumpAndSettle();

      // Preenche os campos de cadastro de dados pessoais
      final nameFild = find.byKey(const Key('nameField'));
      await tester.enterText(nameFild, 'Usuario Teste');

      final countryField = find.byKey(const Key('countryField'));
      await tester.enterText(countryField, 'Brasil');

      final documentTypeField = find.byKey(const Key('documentTypeField'));
      await tester.tap(documentTypeField);
      await tester.pumpAndSettle();
      await tester.tap(find.text('CPF'));
      await tester.pumpAndSettle();

      final documentNumberField = find.byKey(const Key('documentNumberField'));
      await tester.enterText(documentNumberField, '78297579093');

      final masculinoRadio = find.byWidgetPredicate((widget) {
        return widget is Radio<String> && widget.value == 'Masculino';
      });
      expect(masculinoRadio, findsOneWidget);

      await tester.tap(masculinoRadio);
      await tester.pumpAndSettle();

      final phoneField = find.byKey(const Key('phoneField'));
      await tester.enterText(phoneField, '993805936');

      final phoneConfirmationField =
          find.byKey(const Key('phoneConfirmationField'));
      await tester.enterText(phoneConfirmationField, '993805936');

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // Interage com o botão
      await tester.tap(find.byKey(const Key('nextButton')));
      await tester.pumpAndSettle();

      // passo 2: navega para cadastro de dados pessoais de login
      final emailField = find.byKey(const Key('emailField'));
      await tester.enterText(emailField, 'usuario@teste.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final emailConfirmationField =
          find.byKey(const Key('emailConfirmationField'));
      await tester.enterText(emailConfirmationField, 'usuario@teste.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // Nova versãooo
      final passwordField = find.byKey(const Key('passwordField'));

      // Toca no campo
      await tester.tap(passwordField);
      await tester.pumpAndSettle();

      // garante que o teclado irá abrir
      await tester.showKeyboard(passwordField);
      await tester.pumpAndSettle();

      // insere o texto
      await tester.enterText(passwordField, '1234567');
      await tester.pumpAndSettle();

      // Confirmação de senhaa
      final confirmPasswordField =
          find.byKey(const Key('passwordConfirmationField'));

      // Toca no campo
      await tester.tap(confirmPasswordField);
      await tester.pumpAndSettle();

      // garante que o teclado irá abrir
      await tester.showKeyboard(confirmPasswordField);
      await tester.pumpAndSettle();

      // insere o texto
      await tester.enterText(confirmPasswordField, '1234567');
      await tester.pumpAndSettle();

      final confirmButton = find.text('Próximo');
      await tester.tap(confirmButton);
      await tester.pumpAndSettle();

      expect(find.text('Confirmação de Cadastro'), findsOneWidget);
      final confirmRegistrationButton = find.text('Confirmar');
      await tester.tap(confirmRegistrationButton);
      // Aguarda a animação aparecer
      await tester.pumpAndSettle();

      // avança 2 segundos
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      // Avança mais 1 segundo para setar _isLoading e navegar
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      // await tester.pumpAndSettle();

      expect(find.text('Olá!'),
          findsOneWidget); // Verifica o texto da tela de login

      stopWatch.stop();

      results.add({
        'tempo_total_ms': stopWatch.elapsedMilliseconds,
        'frames': frameTimings.length
      });

      // geral relatório
      final report = {
        'fluxo': 'cadastro',
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

      print('Relatório de desempenho do fluxo de cadastro: ${report}');
    });
  });
}

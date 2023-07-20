import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:App_GoHighlevel/main.dart' as app;

void main() {
  group('Testing App', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("Launch App", (widgetTester) async {
      app.TestingApp();
      await widgetTester.pumpAndSettle();
    });

    testWidgets('Favorites operations test', (tester) async {
      await tester.pumpWidget(const app.TestingApp());

      final iconKeys = [
        'icon_0',
        'icon_1',
        'icon_2',
      ];

      for (var icon in iconKeys) {
        await tester.tap(find.byKey(ValueKey(icon)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Added to favorites.'), findsOneWidget);
      }

      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle();

      final removeIconKeys = [
        'remove_icon_0',
        'remove_icon_1',
        'remove_icon_2',
      ];

      for (final iconKey in removeIconKeys) {
        await tester.tap(find.byKey(ValueKey(iconKey)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Removed from favorites.'), findsOneWidget);
      }
    });
  });
}

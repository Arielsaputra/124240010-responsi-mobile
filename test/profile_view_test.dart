import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsi_mobile/views/profile_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({
      'is_logged_in': true,
      'username': 'Ariel',
    });
  });

  testWidgets('shows the saved username and its initial', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProfileView()));
    await tester.pumpAndSettle();

    expect(find.text('Ariel'), findsOneWidget);
    expect(find.text('A'), findsOneWidget);
  });

  testWidgets('logout clears the saved session and returns to login', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: ProfileView()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Logout'));
    await tester.pumpAndSettle();

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool('is_logged_in'), isFalse);
    expect(prefs.getString('username'), isNull);
    expect(find.byType(TextField), findsNWidgets(2));
  });
}

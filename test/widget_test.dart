
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:main/Home/home.dart';
import 'package:http/http.dart' as http;
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    var url = Uri.parse('https://6382330e9842ca8d3ca3bce2.mockapi.io/api/users');
    var rs = await http.get(url);
    var data = jsonDecode(utf8.decode(rs.bodyBytes));
    // Build our app and trigger a frame.
    await tester.pumpWidget( MyApp(data));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

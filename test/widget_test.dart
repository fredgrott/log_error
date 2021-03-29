// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.



import 'package:flutter/material.dart';



import 'package:flutter_test/flutter_test.dart';
import 'package:log_error/app/modules/myapp/my_app.dart';





void main() {

  // ignore: no-empty-block
  setUpAll(() async {});



  // ignore: no-empty-block
  tearDownAll(() async {});

  // ignore: no-empty-block
  tearDown(() async{});

  group('Basic Simple Unit Test', (){
    // use runAsync when yu have calls to such things as Future.delayed in the testWidgets
    testWidgets("Counter increments smoke test", (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      // notice we cannot do a find.byType(FlatButton) because class _FlatButtonWithIcon is hidden
      // so either this or
      // final iconedFlatBtnFinder = find.ancestor(of: find.byIcon(Icons.add),
      // matching: find.byWidgetPredicate((widget) => widget is FlatButton));
      //
      // this happens to be more effective in less code lines
      await tester.tap(find.byIcon(Icons.add));
      // only use pumpAndSettle() when you really do not know how many frames
      // otherwise use tester.pump() and define the number of microseconds
      await tester.pumpAndSettle();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);

    });
    // no need to test for app title via individual test as
    // instead supply a mock app to do title, see app_title_test

  });

}

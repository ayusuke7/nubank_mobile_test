import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_mobile_test/src/app_widget.dart';
import 'package:nubank_mobile_test/src/ui/home/components/home_page.dart';
import 'package:nubank_mobile_test/src/ui/home/controllers/home_controller.dart';
import 'package:nubank_mobile_test/src/ui/home/states/home_state.dart';

import 'src/ui/components/home_page_test.mocks.dart';

void main() {
  late MockHomeController mockController;

  setUp(() {
    mockController = MockHomeController();
    GetIt.I.registerSingleton<HomeController>(mockController);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  testWidgets('render AppWidget', (WidgetTester tester) async {
    when(mockController.value).thenReturn(HomeState());

    await tester.pumpWidget(const AppWidget());
    await tester.pump();

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_mobile_test/src/core/base/base.dart';
import 'package:nubank_mobile_test/src/domain/dtos/alias_dto.dart';
import 'package:nubank_mobile_test/src/ui/home/components/home_page.dart';
import 'package:nubank_mobile_test/src/ui/home/components/loading_list.dart';
import 'package:nubank_mobile_test/src/ui/home/controllers/home_controller.dart';
import 'package:nubank_mobile_test/src/ui/home/states/home_state.dart';

import 'home_page_test.mocks.dart';

@GenerateMocks([HomeController])
void main() {
  late MockHomeController mockController;

  setUp(() {
    mockController = MockHomeController();
    GetIt.I.registerSingleton<HomeController>(mockController);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Widget buildTestableWidget() {
    return MaterialApp(
      home: Builder(
        builder: (context) => HomePage(),
      ),
    );
  }

  testWidgets('renders HomePage and UI elements', (WidgetTester tester) async {
    when(mockController.value).thenReturn(HomeState());
    await tester.pumpWidget(buildTestableWidget());

    expect(find.byType(TextField), findsOneWidget);
    expect(find.byIcon(Icons.send), findsOneWidget);
    expect(find.text('Recently shortned URLs'), findsOneWidget);
  });

  testWidgets('shows error message for invalid URL', (
    WidgetTester tester,
  ) async {
    when(mockController.value).thenReturn(HomeState());
    await tester.pumpWidget(buildTestableWidget());

    await tester.enterText(find.byType(TextField), 'invalid-url');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    expect(find.text('Invalid URL'), findsOneWidget);
  });

  testWidgets('clears input and hides error on valid URL', (
    WidgetTester tester,
  ) async {
    when(mockController.value).thenReturn(HomeState());
    await tester.pumpWidget(buildTestableWidget());

    await tester.enterText(find.byType(TextField), 'https://flutter.dev');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    expect(find.text('Invalid URL'), findsNothing);
    expect(find.byType(TextField), findsOneWidget);
    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.controller?.text, isEmpty);
  });

  testWidgets('shows loading indicator when loading', (
    WidgetTester tester,
  ) async {
    when(mockController.value).thenReturn(
      HomeState(status: StateStatus.loading),
    );

    await tester.pumpWidget(buildTestableWidget());
    await tester.pump();

    expect(find.byType(ListLoadingComponent), findsOneWidget);
  });

  testWidgets('shows list of aliases', (WidgetTester tester) async {
    final alias = AliasDto(alias: '123', url: 'https://test.com');
    when(mockController.value).thenReturn(
      HomeState(
        status: StateStatus.success,
        aliases: [alias],
      ),
    );

    await tester.pumpWidget(buildTestableWidget());
    await tester.pump();

    expect(find.byType(Card), findsOneWidget);
    expect(find.text(alias.alias), findsOneWidget);
    expect(find.text(alias.url), findsOneWidget);
  });
}

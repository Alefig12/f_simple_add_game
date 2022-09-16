import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sum_game/main.dart';
import 'package:sum_game/ui/controllers/controller.dart';

void main() {
  Future<Widget> createHomeScreen() async {
    WidgetsFlutterBinding.ensureInitialized();
    return const MyApp();
  }

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("HomePage -> Score: 0 -> Correct Answer -> Score: 1 ",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();

    await tester.pumpWidget(w);
    MyController myController = Get.find();

    expect(find.byKey(const Key('HomePage')), findsOneWidget);

    expect(find.text('Score: 0'), findsOneWidget);

    var rta;
    rta = myController.op1 + myController.op2;

    // expect(find.text(rta), findsOneWidget);

    tester.tap(find.ancestor(
      of: find.text(rta),
      matching: find.byType(ElevatedButton),
    ));
  });
  testWidgets("HomePage -> Score: 0 -> Inorrect Answer -> Score: 0",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);
  });
  testWidgets(
      "HomePage -> Score: 0 -> Correct Answer -> Score: 1 -> reset -> Score: 0",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);
  });
  testWidgets(
      "HomePage -> Score: 0 -> Correct Answer -> Score: 1 -> Inorrect Answer -> Score: 1 -> reset -> Score: 0 -> Correct Answer -> Score: 1 -> Correct Answer -> Score: 2",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);
  });
}

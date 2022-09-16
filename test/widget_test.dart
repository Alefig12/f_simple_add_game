// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sum_game/main.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:sum_game/ui/controllers/controller.dart';
import 'dart:math';

import 'package:sum_game/ui/pages/home.dart';

extension RandomInt on int {
  static int generate({int min = 0, required int max}) {
    final _random = Random();
    return min + _random.nextInt(max - min);
  }
}

class MockController extends GetxService with Mock implements MyController {
  late final _op1 = Rx<int>(0);
  late final _op2 = Rx<int>(0);
  late final _rta = Rx<int>(0);
  final _vectorRta = Rx<List<int>>([]);
  final _score = Rx<int>(0);

  get score => _score.value;
  get op1 => _op1.value;
  get op2 => _op2.value;
  get rta => _rta.value;

  get vectorRta => _vectorRta.value;

  void checkAnswer(int value) {
    if (value == _rta.value) {
      _score.value = _score.value + 1;
    }
    setValues();
  }

  void setValues() {
    print("Set Values");
    _op1.value = RandomInt.generate(max: 50);
    _op2.value = RandomInt.generate(max: 50);

    _rta.value = _op1.value + _op2.value;
    _vectorRta.value.clear();

    _vectorRta.value.add(_rta.value);

    _vectorRta.value.add(_rta.value + 1);

    _vectorRta.value.add(_rta.value - 1);

    _vectorRta.value.shuffle();
    _vectorRta.refresh();
  }

  @override
  void reset() {
    _score.value = 0;

    setValues();
  }
}

void main() {
  testWidgets('', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    MockController mockColorController = MockController();
    Get.put<MyController>(mockColorController);

    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: SafeArea(child: HomePage()))));
  });
}

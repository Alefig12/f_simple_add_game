import 'package:get/get.dart';
import 'dart:math';

extension RandomInt on int {
  static int generate({int min = 0, required int max}) {
    final _random = Random();
    return min + _random.nextInt(max - min);
  }
}

class MyController extends GetxController {
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

  // int vectorRta(index) {
  //   print(_vectorRta.value[index]);
  //   return _vectorRta.value[index];
  // }

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

  void reset() {
    _score.value = 0;

    setValues();
  }
}

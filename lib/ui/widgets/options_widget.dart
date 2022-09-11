import 'package:flutter/material.dart';
import 'package:sum_game/ui/controllers/controller.dart';
import 'package:get/get.dart';

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    MyController myController = Get.find();
    return Expanded(
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(() => resultButton(myController.vectorRta[0])),
          Obx(() => resultButton(myController.vectorRta[1])),
          Obx(() => resultButton(myController.vectorRta[2])),
        ],
      ),
    );
  }

  Widget resultButton(int value) {
    MyController myController = Get.find();
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () => myController.checkAnswer(value),
          child: Text(value.toString(),
              style: const TextStyle(
                fontSize: 40,
              ))),
    ));
  }
}

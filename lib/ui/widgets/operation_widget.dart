import 'package:flutter/material.dart';
import 'package:sum_game/ui/controllers/controller.dart';
import 'package:get/get.dart';

class Operation extends StatefulWidget {
  const Operation({Key? key}) : super(key: key);

  @override
  State<Operation> createState() => _OperationState();
}

class _OperationState extends State<Operation> {
  @override
  Widget build(BuildContext context) {
    MyController myController = Get.find();
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blue,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Obx(() => OpWidget(text: myController.op1.toString())),
            const OpWidget(text: '+'),
            Obx(() => OpWidget(text: myController.op2.toString())),
            const OpWidget(text: '='),
            const OpWidget(text: '?'),
          ]),
        ),
      ),
    );
  }
}

class OpWidget extends StatelessWidget {
  const OpWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 40,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:sum_game/ui/controllers/controller.dart';
import 'package:get/get.dart';

class Scorebar extends StatefulWidget {
  const Scorebar({Key? key}) : super(key: key);

  @override
  State<Scorebar> createState() => _ScorebarState();
}

class _ScorebarState extends State<Scorebar> {
  @override
  Widget build(BuildContext context) {
    MyController myController = Get.find();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(flex: 1),
                Obx(() => Text(
                      'Score: ${myController.score}',
                      style: const TextStyle(
                        fontSize: 36,
                      ),
                    )),
                const Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      myController.reset();
                    },
                    child: const Icon(Icons.replay),
                  ),
                )
              ],
            )),
      ),
      flex: 1,
    );
  }
}

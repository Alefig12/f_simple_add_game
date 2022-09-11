import 'package:flutter/material.dart';
import 'package:sum_game/ui/controllers/controller.dart';
import 'package:sum_game/ui/widgets/operation_widget.dart';
import 'package:sum_game/ui/widgets/options_widget.dart';
import 'package:sum_game/ui/widgets/scorebar_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyController myController = Get.find();
    myController.setValues();
    return Column(children: const [Scorebar(), Operation(), Options()]);
  }
}

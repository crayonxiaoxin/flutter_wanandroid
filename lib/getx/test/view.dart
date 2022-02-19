import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class TestPage extends StatelessWidget {
  final logic = Get.put(TestLogic());
  final state = Get.find<TestLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          logic.increment();
        },
      ),
      body: Container(
        child: Center(
          child: Obx(() {
            return Text(state.count.string);
          }),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_controller.dart';

void main() {
  // Get.put<UserController>(UserController());
  Get.lazyPut<UserController>(() => UserController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(child: TextField(controller: nameController)),
                  ElevatedButton(
                      onPressed: () {
                        userController.setUserName(nameController.text);
                      },
                      child: const Text('Salvar'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(child: TextField(controller: ageController)),
                  ElevatedButton(
                      onPressed: () {
                        userController
                            .setUserAge(int.tryParse(ageController.text)!);
                      },
                      child: const Text('Salvar'))
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(()=>DataScreen());
                },
                child: const Text('Tela de dados'))
          ],
        ),
      ),
    );
  }
}

class DataScreen extends GetView<UserController> {
  // final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text('Nome : ${controller.user.value.name} ')),
              Obx(() => Text('Idade : ${controller.user.value.age} ')),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Voltar'))
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_controller.dart';

void main() => runApp(const MyApp());

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

  final userController = UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text('Nome : ${userController.user.value.name} ')),
            Obx(() => Text('Idade : ${userController.user.value.age} ')),
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
          ],
        ),
      ),
    );
  }
}

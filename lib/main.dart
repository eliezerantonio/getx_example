import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/value_controller.dart';

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
  final textController = TextEditingController();
  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<ValueController>(
              init: valueController,
              builder: (controller) {
                return Text('Valor definido: ${controller.definedValue.value}');
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TextField(controller: textController),
            ),
            GetX<ValueController>(
              init: valueController,
              initState: (_) {},
              builder: (controller) {
                return ElevatedButton(
                  onPressed: () {
                    String value = textController.text;

                    valueController.setValue(value);
                  },
                  child: controller.isLoading.value
                      ? const CupertinoActivityIndicator(
                          color: Colors.white,
                        )
                      : const Text('Confirmar'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

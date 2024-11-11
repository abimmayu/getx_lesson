import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_lesson/controller/counter_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp(
        theme: counterController.isDark.value
            ? ThemeData.dark()
            : ThemeData.light(),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({
    super.key,
    required this.title,
  });
  final String title;
  final counter = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                'The Value is : ${counter.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counter.changeTheme(),
            tooltip: 'Change Theme',
            child: const Icon(Icons.change_circle),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () => counter.increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () => counter.decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

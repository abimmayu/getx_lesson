import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt count = 0.obs;

  var isDark = false.obs;

  changeTheme() => isDark.value = !isDark.value;

  increment() => count + 2;
  decrement() => count - 1;
}

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CounterController extends GetxController {
  int _count = 0;

  int get count => _count;

  void incrementCount() {
    _count++;
    update();
  }

  void resetCount() {
    _count = 0;
    update();
  }
}

import 'package:get/get.dart';
import 'package:sakib/screen/tasbih/tasbih_calculation.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController());
  }
}

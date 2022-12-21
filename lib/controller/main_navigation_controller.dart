import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class MainNavigationController extends GetxController {

  int currentIndex = 0;

  void updateIndex(int currentIndex){
    this.currentIndex = currentIndex;
    update();
  }
}

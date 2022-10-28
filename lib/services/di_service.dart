
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class DIService {
  static Future<void> init() async {
    //Get.put<MainController>(MainController());
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
  }
}
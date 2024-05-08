import 'package:get/get.dart';

import '../controllers/detail_contact_controller.dart';

class DetailContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailContactController>(
      () => DetailContactController(),
    );
  }
}

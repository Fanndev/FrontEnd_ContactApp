import 'package:get/get.dart';

import '../controllers/edit_contact_controller.dart';

class EditContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditContactController>(
      () => EditContactController(),
    );
  }
}

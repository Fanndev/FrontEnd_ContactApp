import 'package:get/get.dart';

import '../controllers/tambah_contact_controller.dart';

class TambahContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahContactController>(
      () => TambahContactController(),
    );
  }
}

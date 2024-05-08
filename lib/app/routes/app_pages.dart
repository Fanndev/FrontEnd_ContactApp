import 'package:get/get.dart';

import '../modules/detail_contact/bindings/detail_contact_binding.dart';
import '../modules/detail_contact/views/detail_contact_view.dart';
import '../modules/edit_contact/bindings/edit_contact_binding.dart';
import '../modules/edit_contact/views/edit_contact_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/tambah_contact/bindings/tambah_contact_binding.dart';
import '../modules/tambah_contact/views/tambah_contact_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CONTACT,
      page: () => const DetailContactView(),
      binding: DetailContactBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_CONTACT,
      page: () => const TambahContactView(),
      binding: TambahContactBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_CONTACT,
      page: () => EditContactView(),
      binding: EditContactBinding(),
    ),
  ];
}

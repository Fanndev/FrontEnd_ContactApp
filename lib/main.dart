import 'package:contact_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Contactapp());
}

class Contactapp extends StatelessWidget {
  const Contactapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contact App",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}

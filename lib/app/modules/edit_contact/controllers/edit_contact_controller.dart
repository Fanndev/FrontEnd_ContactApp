import 'dart:convert';

import 'package:contact_app/app/modules/data/models/contact_model.dart';
import 'package:contact_app/app/modules/home/controllers/home_controller.dart';
import 'package:contact_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:contact_app/app/modules/data/server/apiDatabase.dart';
import 'package:flutter/material.dart';

class EditContactController extends GetxController {
  late String contactId;
  late HomeController homeController;
  late Contact contact;

  TextEditingController namaController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    contactId = Get.arguments['id'] ?? '';
    homeController = Get.find<HomeController>();
    contact = getContact();
    initiateValues();
    updateController();
    print(contactId);
    print(namaController.text);
    print(telephoneController.text);
    print(alamatController.text);
  }

  Contact getContact() {
    if (contactId.isEmpty) {
      return Contact(id: '', Nama: '', Alamat: '', NoTelp: '');
    }
    return homeController.allContacts.firstWhere(
      (contact) => contact.id == contactId,
      orElse: () => Contact(id: '', Nama: '', Alamat: '', NoTelp: ''),
    );
  }

  void updateController() {
    namaController.text = contact.Nama;
    telephoneController.text = contact.NoTelp;
    alamatController.text = contact.Alamat;
  }

  void initiateValues() {
    namaController.text = contact.Nama;
    telephoneController.text = contact.NoTelp;
    alamatController.text = contact.Alamat;
  }

  Future<bool> updateContact() async {
    try {
      var body = {
        'Nama': namaController.text,
        'Alamat': alamatController.text,
        'NoTelp': telephoneController.text,
      };

      final response = await http.put(
        Uri.parse(Api().updateContact + contactId),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      print(response.body);
      print('Updated contact URL: ${Api().updateContact + contactId}');

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Kontak berhasil diupdate',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );

        Get.offAllNamed(Routes.HOME);
        return true;
      } else {
        Get.snackbar(
          'Error',
          'Gagal mengupdate kontak',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
        return false;
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat mengupdate kontak: $error',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      return false;
    }
  }
}

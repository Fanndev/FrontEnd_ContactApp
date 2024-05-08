import 'dart:async';
import 'dart:io';

import 'package:contact_app/app/modules/data/models/contact_model.dart';
import 'package:contact_app/app/modules/home/controllers/home_controller.dart';
import 'package:contact_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:contact_app/app/modules/data/server/apiDatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailContactController extends GetxController {
  late String contactId;

  late HomeController homeController;
  late Contact contact;

  @override
  void onInit() {
    super.onInit();
    contactId = Get.arguments['id'] ?? '';
    homeController = Get.find<HomeController>();
    contact = getContact();
  }

  Contact getContact() {
    // Ensure that contactId is not empty
    if (contactId.isEmpty) {
      return Contact(id: '', nama: '', alamat: '', noTelp: '');
    }

    // Find the contact by its id
    Contact? foundContact = homeController.allContacts.firstWhere(
      (contact) => contact.id == contactId,
      orElse: () => Contact(id: '', nama: '', alamat: '', noTelp: ''),
    );

    return foundContact!;
  }

  // Delete Contact
  Future<bool> deleteContact(String id) async {
    try {
      final response = await http.delete(Uri.parse(Api().deleteContact + id));

      if (response.statusCode == 200) {
        // Data berhasil dihapus
        Get.snackbar(
          'Success',
          'Kontak berhasil dihapus',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );

        Get.offAllNamed(Routes.HOME);
        return true;
      } else {
        // Gagal menghapus data
        Get.snackbar(
          'Error',
          'Gagal menghapus kontak',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
        return false;
      }
    } catch (error) {
      // Tangani kesalahan
      String errorMessage = 'Terjadi kesalahan saat menghapus kontak.';
      if (error is SocketException) {
        errorMessage =
            'Tidak dapat terhubung ke server. Periksa koneksi internet Anda.';
      } else if (error is TimeoutException) {
        errorMessage = 'Waktu koneksi habis. Coba lagi nanti.';
      } else {
        errorMessage = 'Terjadi kesalahan: $error';
      }
      Get.snackbar(
        'Error',
        errorMessage,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      return false;
    }
  }
}

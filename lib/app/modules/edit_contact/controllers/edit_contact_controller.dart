import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
  late Contact contact; // Gunakan late modifier di sini

  // Variabel untuk menyimpan nilai dari TextField
  late TextEditingController namaController,
      telephoneController,
      alamatController;

  @override
  void onInit() {
    super.onInit();
    contactId = Get.arguments['id'] ?? '';
    homeController = Get.find<HomeController>();
    contact = getContact();
    namaController = TextEditingController(text: contact.nama);
    telephoneController = TextEditingController(text: contact.noTelp);
    alamatController = TextEditingController(text: contact.alamat);
    print(namaController.text);
    print(telephoneController.text);
    print(alamatController.text);

    // Tambahkan listener untuk setiap TextEditingController
    namaController.addListener(_onNamaChanged);
    telephoneController.addListener(_onTelephoneChanged);
    alamatController.addListener(_onAlamatChanged);
  }

  // Method untuk mengambil kontak
  Contact getContact() {
    if (contactId.isEmpty) {
      return Contact(id: '', nama: '', alamat: '', noTelp: '');
    }

    Contact? foundContact = homeController.allContacts.firstWhere(
      (contact) => contact.id == contactId,
      orElse: () => Contact(id: '', nama: '', alamat: '', noTelp: ''),
    );

    return foundContact!;
  }

  // Method untuk menyimpan perubahan pada kontak
  Future<bool> updateContact(
      String id, String nama, String alamat, String noTelp) async {
    try {
      final response = await http.put(
        Uri.parse(Api().updateContact + id),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'nama': nama,
          'alamat': alamat,
          'noTelp': noTelp,
        }),
      );

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

  // Method untuk memperbarui nilai namaController saat ada perubahan pada nama
  void _onNamaChanged() {
    contact.nama = namaController.text;
  }

  // Method untuk memperbarui nilai telephoneController saat ada perubahan pada nomor telepon
  void _onTelephoneChanged() {
    contact.noTelp = telephoneController.text;
  }

  // Method untuk memperbarui nilai alamatController saat ada perubahan pada alamat
  void _onAlamatChanged() {
    contact.alamat = alamatController.text;
  }

  @override
  void onClose() {
    // Hapus listener untuk menghindari memory leaks
    namaController.removeListener(_onNamaChanged);
    telephoneController.removeListener(_onTelephoneChanged);
    alamatController.removeListener(_onAlamatChanged);

    namaController.dispose();
    telephoneController.dispose();
    alamatController.dispose();
    super.onClose();
  }
}

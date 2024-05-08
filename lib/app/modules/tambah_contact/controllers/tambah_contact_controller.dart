import 'package:contact_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:contact_app/app/modules/data/server/apiDatabase.dart';
// Tambahkan import untuk controller home
import 'package:contact_app/app/modules/home/controllers/home_controller.dart';

class TambahContactController extends GetxController {
  // Variabel untuk menyimpan nilai dari TextField
  late TextEditingController namaController,
      telephoneController,
      alamatController;

  @override
  void onInit() {
    super.onInit();
    namaController = TextEditingController();
    telephoneController = TextEditingController();
    alamatController = TextEditingController();
  }

  @override
  void onClose() {
    namaController.dispose();
    telephoneController.dispose();
    alamatController.dispose();
  }

  // Fungsi untuk membuat kontak
  Future<void> createContact(String nama, String noTelp, String alamat) async {
    try {
      final response = await http.post(
        Uri.parse(Api().addContact),
        body: {
          'Nama': nama,
          'NoTelp': noTelp,
          'Alamat': alamat,
        },
      );

      final HomeController homeController = Get.find<HomeController>();

      if (response.statusCode == 201) {
        // Verifikasi keberhasilan penyimpanan di database
        // Implementasi ini dapat bervariasi tergantung pada API Anda
        if (dataIsSaved(response)) {
          // Tindakan jika data berhasil ditambahkan
          Get.snackbar(
            'Sukses',
            'Kontak berhasil ditambahkan',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          // Jika berhasil menambahkan data maka redirect ke halaman home
          Get.offAllNamed(Routes.HOME);
        } else {
          // Tindakan jika data gagal disimpan di database
          print('Gagal menyimpan data ke database');
          Get.snackbar(
            'Error',
            'Gagal menyimpan data ke database',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        // Tindakan jika terjadi kesalahan pada server
        print('Gagal menambahkan data. Status code: ${response.statusCode}');
        Get.snackbar(
          'Error',
          'Gagal menambahkan kontak. Status code: ${response.statusCode}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      // Tangani kesalahan jika panggilan API gagal
      print('Terjadi kesalahan saat melakukan panggilan API: $error');
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat melakukan panggilan API: $error',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Fungsi untuk memeriksa keberhasilan penyimpanan data di database
  bool dataIsSaved(http.Response response) {
    // Implementasi ini bergantung pada API Anda
    // Anda dapat memeriksa respons dari API atau melakukan pengecekan lainnya
    // Misalnya, jika API Anda mengembalikan pesan sukses atau ID kontak baru
    return true; // Ganti dengan implementasi Anda
  }
}

import 'dart:convert';

import 'package:contact_app/app/modules/data/models/contact_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:contact_app/app/modules/data/server/apiDatabase.dart';

class HomeController extends GetxController {
  RxList<Contact> allContacts = <Contact>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDataContact();
  }

  Future<void> getDataContact() async {
    try {
      Uri url = Uri.parse(Api().listContact);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        // print(responseData);

        // Periksa apakah atribut 'result' ada dan bukan null
        if (responseData != null && responseData.containsKey('result')) {
          // Ubah respons 'result' menjadi daftar objek Contact
          List<dynamic> contactData = responseData['result'];
          List<Contact> contacts =
              contactData.map((json) => Contact.fromJson(json)).toList();
          allContacts.assignAll(contacts);
          print('Data kontak berhasil diambil: $allContacts');
        } else {
          // Tangani kasus ketika atribut 'result' tidak ada atau nilainya null
          print('Atribut "result" tidak ada atau nilainya null dalam respons');
          // Contoh: Tambahkan logika untuk menampilkan pesan kesalahan atau melakukan tindakan lain
        }
      } else {
        print(
            'Gagal mengambil data kontak. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Terjadi kesalahan saat mengambil data kontak: $error');
    }
  }
}

import 'package:contact_app/app/modules/edit_contact/views/edit_contact_view.dart';
import 'package:contact_app/app/resource/assets_path.dart';
import 'package:contact_app/app/resource/icons.dart';
import 'package:contact_app/app/routes/app_pages.dart';
import 'package:contact_app/app/theme/material_font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_contact_controller.dart';

class DetailContactView extends GetView<DetailContactController> {
  const DetailContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailContactController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back(result: true);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Ambil ID kontak yang sedang ditampilkan
                              String contactId = controller.contactId;
                              // Get.to(EditContactView());
                              // Tambahkan logika untuk mengedit kontak
                              Get.toNamed(Routes.EDIT_CONTACT,
                                  arguments: {'id': contactId});
                              print(contactId);
                            },
                            child: Text('Edit'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Tambahkan logika untuk menghapus kontak
                              controller.deleteContact(controller.contactId);
                              Navigator.pop(
                                  context); // Tutup bottom sheet setelah mengklik Delete
                            },
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: Icon(settingIcon),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(userImage),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Obx(() {
              var contact = controller.getContact();
              return Text(
                "${contact.Nama}",
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semibold,
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    //
                  },
                  icon: Icon(Icons.call),
                ),
                IconButton(
                  onPressed: () {
                    //
                  },
                  icon: Icon(Icons.message),
                ),
                IconButton(
                  onPressed: () {
                    //
                  },
                  icon: Icon(Icons.email),
                ),
              ],
            ),
          ),
          // Nomor hp
          Obx(() {
            var contact = controller.getContact();
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      'Nomor hp',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    subtitle: Text(
                      "${contact.NoTelp}",
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
          // Alamat
          Obx(() {
            var contact = controller.getContact();
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      'Alamat',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    subtitle: Text(
                      "${contact.Alamat}",
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            );
          })
        ],
      ),
    );
  }
}

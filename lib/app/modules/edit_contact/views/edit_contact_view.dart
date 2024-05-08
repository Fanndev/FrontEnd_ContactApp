import 'package:contact_app/app/routes/app_pages.dart';
import 'package:contact_app/app/theme/material_color.dart';
import 'package:contact_app/app/theme/material_font.dart';
import 'package:contact_app/app/widget/form_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_contact_controller.dart';

class EditContactView extends GetView<EditContactController> {
  EditContactView({Key? key}) : super(key: key);

  // TextEditingController nameC = TextEditingController();
  // TextEditingController telephoneC = TextEditingController();
  // TextEditingController alamatC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        backgroundColor: appWhite,
        leading: IconButton(
          onPressed: () {
            Get.back(result: true);
          },
          icon: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(
              Icons.close,
              size: 30,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              onPressed: () {
                // Panggil fungsi untuk menyimpan perubahan pada kontak
                controller.updateContact(
                  controller.contact.id,
                  controller.namaController.text,
                  controller.telephoneController.text,
                  controller.alamatController.text,
                );
              },
              icon: const Icon(
                Icons.check,
                size: 30,
              ),
            ),
          ),
        ],
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Edit Contact',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.contact != null) {
          // Perbaiki pengecekan ini
          return ListView(
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: appWhite,
                ),
                child: Column(
                  children: [
                    CustomFormField(
                      title: 'Nama',
                      inputType: TextInputType.name,
                      controller: controller.namaController,
                    ),
                    const SizedBox(height: 30),
                    CustomFormField(
                      title: 'Ponsel Number',
                      inputType: TextInputType.number,
                      controller: controller.telephoneController,
                    ),
                    const SizedBox(height: 30),
                    CustomFormField(
                      title: 'Alamat',
                      inputType: TextInputType.streetAddress,
                      controller: controller.alamatController,
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}

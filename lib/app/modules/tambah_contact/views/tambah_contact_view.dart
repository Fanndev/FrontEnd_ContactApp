import 'package:contact_app/app/routes/app_pages.dart';
import 'package:contact_app/app/theme/material_color.dart';
import 'package:contact_app/app/theme/material_font.dart';
import 'package:contact_app/app/widget/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tambah_contact_controller.dart';

class TambahContactView extends GetView<TambahContactController> {
  const TambahContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        backgroundColor: appWhite,
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.HOME);
          },
          icon: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: const Icon(
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
                controller.createContact(
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
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'Kontak baru',
            style: blackTextStyle.copyWith(fontWeight: semibold),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            width: 155,
            height: 10,
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            // Jika Anda ingin menambahkan gambar, uncomment dan definisikan gambar yang akan digunakan.
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/your_image.png'),
            //   ),
            // ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: appWhite,
            ),
            child: Column(
              children: [
                CustomFormField(
                    title: 'Nama',
                    inputType: TextInputType.name,
                    controller: controller.namaController,),
                SizedBox(height: 30),
                CustomFormField(
                    title: 'Ponsel Number',
                    inputType: TextInputType.number,
                    controller: controller.telephoneController,),
                SizedBox(height: 30),
                CustomFormField(
                    title: 'Address',
                    inputType: TextInputType.streetAddress,
                    controller: controller.alamatController,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

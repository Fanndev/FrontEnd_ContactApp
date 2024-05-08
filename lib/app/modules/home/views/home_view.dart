import 'package:contact_app/app/resource/assets_path.dart';
import 'package:contact_app/app/routes/app_pages.dart';
import 'package:contact_app/app/theme/material_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:contact_app/app/resource/icons.dart';
import 'package:contact_app/app/theme/material_font.dart';
import 'package:contact_app/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style:
                  blackTextStyle.copyWith(fontWeight: semibold, fontSize: 14),
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(settingIcon),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  indicatorColor: appGreen,
                  dividerColor: Colors.transparent,
                  labelColor: appGreen,
                  tabs: [
                    Tab(
                      child: Text('Telepon',
                          style: TextStyle(
                            fontWeight: semibold,
                          )),
                    ),
                    Tab(
                      child: Text(
                        'Kontak',
                        style: TextStyle(
                          fontWeight: semibold,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildTelephoneTab(),
                      _buildContactTab(), // Memanggil fungsi untuk membangun tab kontak
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Page telpon
  Widget _buildTelephoneTab() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: ListTile(
            leading: Icon(
              telephoneIcon,
              size: 20,
            ),
            contentPadding: EdgeInsets.only(left: 30),
            title: Text(
              'username',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ),
        )
      ],
    );
  }

  // page Kontak
  Widget _buildContactTab() {
    return Stack(
      children: [
        Obx(() {
          final contacts = homeController.allContacts;
          if (contacts.isEmpty) {
            return Center(
              child: Text('No Contacts'),
            );
          }
          // Gunakan Obx untuk mengamati perubahan pada allContact
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10), // Ubah padding menjadi margin
                child: ListTile(
                  onTap: () {
                    // int contactIndex = index;
                    String contactId =
                        homeController.allContacts[index].id.toString();
                    // Navigasi ke halaman detail kontak
                    Get.toNamed(Routes.DETAIL_CONTACT,
                        arguments: {'id': contactId});
                    print(contactId);
                  },
                  leading: Container(
                    margin: const EdgeInsets.only(
                        right:
                            10), // Tambahkan margin kanan antara gambar dan teks
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          userImage,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    contact.nama,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                ),
              );
            },
          );
        }),
        // Tombol Plus hanya ditampilkan di tab Kontak
        Padding(
          padding: const EdgeInsets.only(right: 15, bottom: 20),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: appWhite,
              onPressed: () {
                Get.toNamed(Routes.TAMBAH_CONTACT);
              },
              child: Icon(
                Icons.add,
                color: appblackCharchoel,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// import 'package:contact_app/app/modules/edit_contact/controllers/edit_contact_controller.dart';
import 'package:contact_app/app/theme/material_font.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  // final c = Get.put(() => EditContactController());
  // String initialVal = "";

  CustomFormField({
    Key? key,
    required this.title,
    this.obscureText = false,
    required this.controller, // Gunakan TextEditingController
    this.isShowTitle = true,
    this.onTap,
    this.readOnly = false,
    this.inputType = TextInputType.name,
  }) : super(key: key);

  final String title;
  final bool obscureText;
  final TextEditingController controller; // Gunakan TextEditingController
  final bool isShowTitle;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        if (isShowTitle)
          const SizedBox(
            height: 2,
          ),
        TextFormField(
          obscureText: obscureText,
          controller: controller, // Gunakan controller yang disediakan
          readOnly: readOnly,
          onTap: onTap,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: !isShowTitle ? title : null,
            border: UnderlineInputBorder(),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }
}

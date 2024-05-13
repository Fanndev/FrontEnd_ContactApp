import 'package:contact_app/app/theme/material_font.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController controller;
  final bool isShowTitle;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextInputType inputType;
  final String?
      initialValue; // Tambahkan initialValue sebagai parameter opsional

  const CustomFormField({
    Key? key,
    required this.title,
    this.obscureText = false,
    required this.controller,
    this.isShowTitle = true,
    this.onTap,
    this.readOnly = false,
    this.inputType = TextInputType.name,
    this.initialValue, // Tambahkan initialValue ke dalam konstruktor
  }) : super(key: key);

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
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          keyboardType: inputType,
          initialValue: initialValue, // Gunakan initialValue di sini
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

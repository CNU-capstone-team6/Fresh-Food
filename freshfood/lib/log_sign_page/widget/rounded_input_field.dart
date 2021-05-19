import 'package:flutter/material.dart';
import 'package:freshfood/constants.dart';
import 'package:freshfood/log_sign_page/widget/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final String labelText;
  final TextInputType keyboardType;
  final bool enabled;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.controller,
    this.enabled,
    this.icon = Icons.person,
    this.onChanged,
    this.labelText,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          labelText: labelText,
        ),
      ),
    );
  }
}
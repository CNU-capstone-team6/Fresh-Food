import 'package:flutter/material.dart';
import 'package:freshfood/constants.dart';
import 'package:freshfood/log_sign_page/widget/text_field_container.dart';
import 'package:parse_server_sdk_flutter/generated/i18n.dart';

class RoundedPasswordField extends StatelessWidget {
final ValueChanged<String> onChanged;
final TextEditingController controller;
final String labelText;
final bool enabled;

const RoundedPasswordField({
Key key,
this.onChanged,
  this.enabled,
  this.controller,
  this.labelText,
}) : super(key: key);

@override
Widget build(BuildContext context) {
  return TextFieldContainer(
    child: TextField(
      enabled: enabled,
      obscureText: true,
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      controller: controller,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: kPrimaryColor,
        ),
        border: InputBorder.none,
        labelText: labelText,
      ),
    ),
  );
}
}
import 'package:flutter/material.dart';
import 'custon_icons.dart';

class CustomField extends StatelessWidget {
  final String? label;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final bool? filled;
  final Color? fillColor;
  final InputBorder? border;
  final IconButton? prefixIcon;
  final Color? prefixIconColor;
  final IconButton? suffixIconButton;
  final Color? suffixIconColor;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  CustomField({
    Key? key,
    this.label,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.keyboardType,
    this.style,
    this.filled,
    this.fillColor,
    this.border,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIconButton,
    this.suffixIconColor,
    this.obscureText = false,
    this.controller,
    this.validator,
  })  : assert(obscureText == true ? suffixIconButton == null : true,
            'ObscureText não pode ser enviado junto com suffixbutton.'),
        obscureTextVN = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          keyboardType: keyboardType,
          style: style,
          controller: controller,
          validator: validator,
          obscureText: obscureTextValue,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            labelText: label,
            labelStyle: labelStyle,
            filled: filled,
            fillColor: fillColor,
            border: border,
            prefixIcon: prefixIcon,
            prefixIconColor: prefixIconColor,
            isDense: true,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.red),
            ),
            suffixIcon: suffixIconButton ??
                (obscureText == true
                    ? IconButton(
                        onPressed: () {
                          obscureTextVN.value = !obscureTextVN.value;
                        },
                        icon: Icon(
                          obscureTextValue
                              ? CustomIcons.eye_slash
                              : CustomIcons.eye,
                          size: 15,
                          color: obscureTextValue ? Colors.white : Colors.grey,
                        ),
                      )
                    : null),
          ),
        );
      },
    );
  }
}

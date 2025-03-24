import 'package:flutter/material.dart';
import 'package:moniepoint_test/config/theme/app_palette.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final bool isEnabled;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color fillColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSaved;

  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.obscureText = false,
    this.isEnabled = true,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.preffixIcon,
    this.suffixIcon,
    this.borderColor = const Color(0xFFBDBDBD),
    this.focusedBorderColor = AppPalette.primary,
    this.errorBorderColor = Colors.redAccent,
    this.fillColor = const Color(0xFFF5F5F5),
    this.borderRadius = const BorderRadius.all(Radius.circular(30.0)),
    this.contentPadding = const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    this.hintStyle,
    this.textStyle,
    this.validator,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      enabled: isEnabled,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: fillColor,
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
        prefixIcon: preffixIcon,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: borderColor, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: focusedBorderColor, width: 0.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: errorBorderColor, width: 0.5),
        ),
      ),
      style: textStyle ?? const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
      onSaved: (value) => onSaved,
    );
  }
}

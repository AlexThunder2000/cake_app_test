import 'package:cake_app_test/utils/color_source.dart';
import 'package:cake_app_test/utils/text_style_source.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType textInputType;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyleSourceApp.helvetica16,
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: suffixIcon,
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: ColorSourceApp.lightGrey,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: ColorSourceApp.lightGrey,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        hintStyle: TextStyleSourceApp.helvetica16.copyWith(
          color: ColorSourceApp.lightGrey,
        ),
        hintText: hintText,
      ),
      onChanged: (value) => onChanged(value),
    );
  }
}

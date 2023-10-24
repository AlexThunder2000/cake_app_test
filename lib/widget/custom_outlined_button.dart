import 'package:cake_app_test/utils/color_source.dart';
import 'package:cake_app_test/utils/text_style_source.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final Color foregroundColor;
  final Color? borderColor;
  final Color disableForegroundColor;
  final bool isEnabled;
  final Widget? leadingIcon;

  const CustomOutlinedButton({
    super.key,
    required this.title,
    required this.callback,
    this.foregroundColor = ColorSourceApp.black,
    this.disableForegroundColor = ColorSourceApp.lightGrey,
    this.isEnabled = true,
    this.leadingIcon,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isEnabled ? () => callback() : null,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        disabledForegroundColor: disableForegroundColor,
        side: BorderSide(
          color: isEnabled
              ? borderColor ?? foregroundColor
              : disableForegroundColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: TextStyleSourceApp.helvetica16,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leadingIcon ?? const SizedBox.shrink(),
            leadingIcon == null
                ? const SizedBox.shrink()
                : const SizedBox(width: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}

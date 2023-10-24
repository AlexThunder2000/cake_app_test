import 'package:cake_app_test/utils/color_source.dart';
import 'package:cake_app_test/utils/text_style_source.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color backgroundColor;
  final Color disableBackgroundColor;
  final Color foregroundColor;
  final Color disableForegroundColor;
  final bool isEnabled;
  final VoidCallback callback;
  final Widget? leadingIcon;
  final String title;

  const CustomElevatedButton({
    super.key,
    this.backgroundColor = ColorSourceApp.black,
    this.disableBackgroundColor = ColorSourceApp.lightGrey,
    this.foregroundColor = ColorSourceApp.white,
    this.disableForegroundColor = ColorSourceApp.white,
    this.isEnabled = true,
    required this.callback,
    this.leadingIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? () => callback() : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        disabledBackgroundColor: disableBackgroundColor,
        disabledForegroundColor: disableForegroundColor,
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

import 'package:cake_app_test/responsive.dart';
import 'package:cake_app_test/utils/color_source.dart';
import 'package:cake_app_test/utils/decoration_source.dart';
import 'package:cake_app_test/utils/icon_source.dart';
import 'package:cake_app_test/utils/text_style_source.dart';
import 'package:cake_app_test/widget/custom_elevated_button.dart';
import 'package:cake_app_test/widget/custom_text_button.dart';
import 'package:cake_app_test/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSourceApp.background,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context)
                    ? 16
                    : Responsive.isTablet(context)
                        ? 55
                        : 130,
                vertical: Responsive.isMobile(context)
                    ? 16
                    : Responsive.isTablet(context)
                        ? 80
                        : 110,
              ),
              child: CustomTextButton(
                  title: '',
                  leadingIcon: SvgPicture.asset(IconSourceApp.arrowBack),
                  callback: () {
                    Navigator.of(context).pop();
                  }),
            ),
            Center(
              child: Container(
                width: Responsive.isMobile(context) ? 380 : 400,
                decoration: customContainerDecoration,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(
                  vertical: Responsive.isMobile(context) ? 24 : 32,
                  horizontal: Responsive.isMobile(context) ? 16 : 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Вітаємо в CakeApp!',
                      style: TextStyleSourceApp.helvetica24,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Введіть свій логін та пароль, щоб продовжити',
                      style: TextStyleSourceApp.helvetica16.copyWith(
                        color: ColorSourceApp.grey,
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      hintText: 'Електрона адреса',
                      prefixIcon: SvgPicture.asset(
                        IconSourceApp.mail,
                        fit: BoxFit.scaleDown,
                      ),
                      onChanged: (text) {},
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      hintText: 'Пароль',
                      prefixIcon: SvgPicture.asset(
                        IconSourceApp.lock,
                        fit: BoxFit.scaleDown,
                      ),
                      onChanged: (text) {},
                    ),
                    const SizedBox(height: 24),
                    CustomElevatedButton(callback: () {}, title: 'Увійти'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

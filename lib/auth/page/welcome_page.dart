import 'package:cake_app_test/auth/page/login_page.dart';
import 'package:cake_app_test/auth/page/register_page.dart';
import 'package:cake_app_test/responsive.dart';
import 'package:cake_app_test/utils/color_source.dart';
import 'package:cake_app_test/utils/decoration_source.dart';
import 'package:cake_app_test/utils/icon_source.dart';
import 'package:cake_app_test/utils/text_style_source.dart';
import 'package:cake_app_test/widget/custom_elevated_button.dart';
import 'package:cake_app_test/widget/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSourceApp.background,
      body: SafeArea(
        child: Center(
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
                  'Створіть обліковий запис або увійдіть, перш ніж додати рецепт',
                  style: TextStyleSourceApp.helvetica16.copyWith(
                    color: ColorSourceApp.grey,
                  ),
                ),
                const SizedBox(height: 24),
                CustomElevatedButton(
                  title: 'Зареєструватись',
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                CustomElevatedButton(
                  title: 'Увійти',
                  foregroundColor: ColorSourceApp.black,
                  backgroundColor: ColorSourceApp.background,
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: ColorSourceApp.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'або',
                        style: TextStyleSourceApp.helvetica16.copyWith(
                          color: ColorSourceApp.grey,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: ColorSourceApp.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                CustomOutlinedButton(
                  title: 'Увійти через  Google',
                  borderColor: ColorSourceApp.lightGrey,
                  leadingIcon: SvgPicture.asset(IconSourceApp.google),
                  callback: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

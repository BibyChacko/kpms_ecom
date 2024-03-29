import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpms_project/src/core/constants/strings.dart';
import 'package:kpms_project/src/core/theme/app_theme.dart';
import 'package:kpms_project/src/core/theme/text_theme.dart';
import 'package:kpms_project/src/features/authentication/presentation/view/pages/signup_page.dart';
import '../widgets/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              // AppImage.assets(AppAssets.appLogo, height: 100, width: 180),
              const SizedBox(
                height: 40,
              ),
              const LoginFormWidget(),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () => _navigateToSignUp(context),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: Strings.newUserText, style: AppTextTheme.bodyStyle),
                  const TextSpan(text: "  "),
                  TextSpan(
                      text: Strings.signUp,
                      style: AppTextTheme.bodyStyle.copyWith(
                        color: AppTheme.primaryColor,
                      ))
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToSignUp(BuildContext context) {
    Get.to(const SignUpPage());
  }
}

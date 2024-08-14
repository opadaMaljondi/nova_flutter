import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/helpers/regex_validator.dart';
import 'package:real_state/core/widgets/primary_button.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/auth/presentation/widgets/auth_header_section.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: resetPasswordFormKey,
            child: Column(
              children: [
                const AuthHeaderSection(
                  title: 'Reset Password',
                  iconPath: AppAssets.resetPassword,
                  subTitle: 'Here you can write anything related to this page.',
                ),
                SizedBox(
                  height: 25.h,
                ),
                PrimaryTextField(
                  labelText: 'New Password',
                  labelIcon: SvgPicture.asset(AppAssets.password),
                  validator: (value) => RegexValidator.validateRequired(value),
                  isObscureText: true,
                  controller: passwordTextController,
                ),
                SizedBox(
                  height: 25.h,
                ),
                PrimaryTextField(
                  labelText: 'Re-Enter New Password',
                  labelIcon: SvgPicture.asset(AppAssets.password),
                  isObscureText: true,
                  validator: (value) => RegexValidator.validateConfirmPassword(
                    value,
                    passwordTextController.text,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 60.h,
                ),
                PrimaryButton(
                  label: 'Next',
                  onPressed: () {
                    if (!resetPasswordFormKey.currentState!.validate()) return;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

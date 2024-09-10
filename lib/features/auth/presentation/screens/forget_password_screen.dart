import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/helpers/regex_validator.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/core/widgets/primary_button.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/auth/presentation/widgets/auth_header_section.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: forgetPasswordFormKey,
            child: Column(
              children: [
                AuthHeaderSection(
                  title: LocaleKeys.forgotPassword.tr(),
                  iconPath: AppAssets.resetPassword,
                  subTitle: LocaleKeys.youCanTypeAnything.tr(),
                  isLargeContent: false,
                ),
                SizedBox(
                  height: 25.h,
                ),
                PrimaryTextField(
                  labelText: LocaleKeys.phoneNumber.tr(),
                  inputType: TextInputType.phone,
                  validator: (value) => RegexValidator.validatePhone(value),
                  labelIcon: SvgPicture.asset(AppAssets.phone),
                ),
                SizedBox(
                  height: 50.h,
                ),
                PrimaryButton(
                  label: 'Next',
                  onPressed: () {
                    if (!forgetPasswordFormKey.currentState!.validate()) return;
                    context.push(AppRoutes.verificationCodeScreen);
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

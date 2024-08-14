import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/widgets/primary_button.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/auth/presentation/widgets/auth_header_section.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthHeaderSection(
                title: 'Forget Password',
                iconPath: AppAssets.resetPassword,
                subTitle: 'Here you can write anything related to this page.',
              ),
              SizedBox(
                height: 25.h,
              ),
              PrimaryTextField(
                labelText: 'Phone Number',
                inputType: TextInputType.phone,
                labelIcon: SvgPicture.asset(AppAssets.phone),
              ),
              SizedBox(
                height: 50.h,
              ),
              PrimaryButton(
                label: 'Next',
                onPressed: () {
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
    );
  }
}

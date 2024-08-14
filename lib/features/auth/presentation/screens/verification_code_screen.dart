import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/widgets/primary_button.dart';
import 'package:real_state/features/auth/presentation/widgets/auth_header_section.dart';
import 'package:real_state/features/auth/presentation/widgets/verification_code_field.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthHeaderSection(
                title: 'Verification Code',
                iconPath: AppAssets.verificationCode,
                subTitle: 'Here you can write anything related to this page.',
              ),
              SizedBox(
                height: 25.h,
              ),
              const VerificationCodeField(),
              SizedBox(
                height: 60.h,
              ),
              PrimaryButton(
                label: 'Continue',
                onPressed: () {},
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Text(
                  'We will send you back within 00:30',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

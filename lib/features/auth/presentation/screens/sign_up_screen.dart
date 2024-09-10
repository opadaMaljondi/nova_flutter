import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/helpers/regex_validator.dart';
import 'package:real_state/core/widgets/primary_button.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/auth/presentation/widgets/agree_button.dart';
import 'package:real_state/features/auth/presentation/widgets/auth_header_section.dart';
import 'package:real_state/features/auth/presentation/widgets/chose_account_type_section.dart';
import 'package:real_state/features/auth/presentation/widgets/or_sign_in_section.dart';
import 'package:real_state/features/auth/presentation/widgets/phone_number_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isAgree = false;
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: signUpFormKey,
            child: Column(
              children: [
                const AuthHeaderSection(
                  title: 'Create new account',
                  iconPath: AppAssets.signUp,
                  subTitle: 'Here you can write anything related to this page.',
                ),
                const ChoseAccountTypeSection(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: PrimaryTextField(
                          labelText: 'First name',
                          hintText: 'First name',
                          padding: EdgeInsets.zero,
                          validator: (value) => RegexValidator.validateName(value),
                          labelIcon: SvgPicture.asset(AppAssets.name),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: PrimaryTextField(
                          labelText: 'Last name',
                          hintText: 'Last name',
                          padding: EdgeInsets.zero,
                          validator: (value) => RegexValidator.validateName(value),
                          labelIcon: SvgPicture.asset(AppAssets.name),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const PhoneNumberTextField(),
                SizedBox(
                  height: 20.h,
                ),
                PrimaryTextField(
                  labelText: 'Password',
                  labelIcon: SvgPicture.asset(AppAssets.password),
                  validator: (value) => RegexValidator.validateRequired(value),
                  isObscureText: true,
                  controller: passwordTextController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                PrimaryTextField(
                  labelText: 'Re-Enter Password',
                  labelIcon: SvgPicture.asset(AppAssets.password),
                  validator: (value) => RegexValidator.validateConfirmPassword(
                    value,
                    passwordTextController.text,
                  ),
                  isObscureText: true,
                ),
                SizedBox(
                  height: 10.h,
                ),
                AgreeButton(
                  onChange: (isAgree) {
                    setState(() {
                      this.isAgree = isAgree;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.w),
                  child: PrimaryButton(
                    label: 'Sign Up',
                    onPressed: isAgree
                        ? () {
                            if (!signUpFormKey.currentState!.validate()) return;
                            context.push(AppRoutes.verificationCodeScreen);
                          }
                        : null,
                  ),
                ),
                const OrSignInSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

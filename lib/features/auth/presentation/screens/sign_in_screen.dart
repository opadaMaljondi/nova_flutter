import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/helpers/regex_validator.dart';
import 'package:real_state/core/services/router_service.dart';
import 'package:real_state/core/widgets/primary_button.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/auth/presentation/widgets/auth_header_section.dart';
import 'package:real_state/features/auth/presentation/widgets/remember_me_and_forget_password_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: signInFormKey,
            child: Column(
              children: [
                const AuthHeaderSection(
                  title: 'Sign In',
                  iconPath: AppAssets.signIn,
                  subTitle: 'Here you can write anything related to this page.',
                ),
                SizedBox(
                  height: 25.h,
                ),
                PrimaryTextField(
                  labelText: 'Phone Number',
                  inputType: TextInputType.phone,
                  labelIcon: SvgPicture.asset(AppAssets.phone),
                  validator: (value) => RegexValidator.validatePhone(value),
                ),
                SizedBox(
                  height: 25.h,
                ),
                PrimaryTextField(
                  labelText: 'Password',
                  labelIcon: SvgPicture.asset(AppAssets.password),
                  validator: (value) => RegexValidator.validateRequired(value),
                  isObscureText: true,
                ),
                const RememberMeAndForgetPasswordButton(),
                PrimaryButton(
                  label: 'Sign In',
                  onPressed: () {
                    if (!signInFormKey.currentState!.validate()) return;
                    RouterService.setInitialRoute(AppRoutes.mainScreen);
                    context.go(AppRoutes.mainScreen);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                PrimaryButton(
                  label: 'Create new account',
                  backgroundColor: AppColors.black,
                  onPressed: () {
                    context.push(AppRoutes.signUpScreen);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

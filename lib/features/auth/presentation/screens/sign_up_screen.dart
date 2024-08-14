import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/helpers/regex_validator.dart';
import 'package:real_state/core/widgets/primary_button.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/auth/presentation/widgets/account_type_card.dart';
import 'package:real_state/features/auth/presentation/widgets/auth_header_section.dart';
import 'package:real_state/features/auth/presentation/widgets/or_divider.dart';
import 'package:real_state/features/auth/presentation/widgets/phone_number_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool rememberMe = false;
  bool isOfficeAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthHeaderSection(
                title: 'Create new account',
                iconPath: AppAssets.signUp,
                subTitle: 'Here you can write anything related to this page.',
              ),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  children: [
                    SvgPicture.asset(AppAssets.ellipse),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Text(
                      'Chose account type',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    AccountTypeCard(
                      label: 'Office',
                      iconPath: AppAssets.office,
                      isSelected: isOfficeAccount,
                      onTap: () {
                        setState(() {
                          isOfficeAccount = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    AccountTypeCard(
                      label: 'Client',
                      iconPath: AppAssets.client,
                      isSelected: !isOfficeAccount,
                      onTap: () {
                        setState(() {
                          isOfficeAccount = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
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
                height: 25.h,
              ),
              const PhoneNumberTextField(),
              SizedBox(
                height: 25.h,
              ),
              PrimaryTextField(
                labelText: 'Password',
                labelIcon: SvgPicture.asset(AppAssets.password),
                isObscureText: true,
              ),
              SizedBox(
                height: 25.h,
              ),
              PrimaryTextField(
                labelText: 'Re-Enter Password',
                labelIcon: SvgPicture.asset(AppAssets.password),
                isObscureText: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        rememberMe = !rememberMe;
                        Logger().w(rememberMe);
                        setState(() {});
                      },
                      borderRadius: BorderRadius.circular(50),
                      child: rememberMe
                          ? Radio(
                              value: 'selected',
                              groupValue: 'selected',
                              onChanged: null,
                              visualDensity: VisualDensity.compact,
                              fillColor: WidgetStateProperty.resolveWith(
                                (states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return AppColors.primary;
                                  }
                                  return AppColors.primary;
                                },
                              ),
                            )
                          : const Radio(
                              value: 'not selected',
                              groupValue: 'selected',
                              visualDensity: VisualDensity.compact,
                              onChanged: null,
                            ),
                    ),
                    Text(
                      'I Agree',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(5.r),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2),
                        child: Text(
                          'policy and conditions',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primary,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.w),
                child: PrimaryButton(
                  label: 'Sign Up',
                  onPressed: () {
                    context.push(AppRoutes.verificationCodeScreen);
                  },
                ),
              ),
              const OrDivider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have Account ?!',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      borderRadius: BorderRadius.circular(5.r),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2),
                        child: Text(
                          'Sign In',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primary,
                              ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

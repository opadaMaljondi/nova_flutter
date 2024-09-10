import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/translations/local_keys.g.dart';

class RememberMeAndForgetPasswordButton extends StatefulWidget {
  const RememberMeAndForgetPasswordButton({super.key});

  @override
  State<RememberMeAndForgetPasswordButton> createState() => _RememberMeAndForgetPasswordButtonState();
}

class _RememberMeAndForgetPasswordButtonState extends State<RememberMeAndForgetPasswordButton> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      rememberMe = !rememberMe;
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
                   LocaleKeys.rememberPassord.tr(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  context.push(AppRoutes.forgetPasswordScreen);
                },
                borderRadius: BorderRadius.circular(5.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2),
                  child: Text(
                LocaleKeys.forgotPassword.tr(),
                    style: TextStyle(fontSize: 12.sp, decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 60.h,
        ),
      ],
    );
  }
}

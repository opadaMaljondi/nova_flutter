import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/auth/presentation/widgets/or_divider.dart';

class OrSignInSection extends StatelessWidget {
  const OrSignInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Have Account ?!',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.primary,
                ),
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
    );
  }
}

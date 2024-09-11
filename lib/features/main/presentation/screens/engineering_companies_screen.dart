import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/main/presentation/widgets/engineering_companies_list.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';

class EngineeringCompaniesScreen extends StatelessWidget {
  const EngineeringCompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PrimaryAppbar(title: LocaleKeys.engineeringCompanies.tr()),
              Divider(
                thickness: 0.3,
                color: AppColors.mainGray,
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryTextField(
                        hintText: LocaleKeys.search.tr(),
                        padding: EdgeInsets.zero,
                        textInputAction: TextInputAction.search,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20.w,
                          color: AppColors.mainGray,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: PrimaryIconButton(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(15.r),
                        onPressed: () {},
                        child: const Icon(
                          Icons.search,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              const EngineeringCompaniesLits(),
            ],
          ),
        ),
      ),
    );
  }
}

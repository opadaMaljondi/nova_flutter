import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';
import 'package:real_state/features/main/presentation/widgets/properties_card.dart';
import 'package:real_state/features/main/presentation/widgets/trader_info.dart';

class TraderDetailsScreen extends StatelessWidget {
  const TraderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrimaryAppbar(
                title: 'Ahmed mansour',
              ),
              Divider(
                thickness: 0.3,
                color: AppColors.mainGray,
                height: 30.h,
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const TraderInfo(),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w),
                child: Text(
                  LocaleKeys.description.tr(),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 17.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.primary.withOpacity(.1),
                  ),
                  child: const Text(
                    'A complete description of the property owner. A complete description of the property owner. A complete description of the property owner',
                  ),
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w),
                child: Text(
                  LocaleKeys.propertiesOffered.tr(),
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 11.h,
                    childAspectRatio: 0.62,
                  ),
                  itemBuilder: (context, index) {
                    return const PropertiesCard(
                      isFavorite: false,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

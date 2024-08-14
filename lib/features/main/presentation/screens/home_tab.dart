import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/main/presentation/widgets/shortcut_button.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.profile,
                        width: 80.w,
                        height: 80.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ahmad Nasser",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: AppColors.primary,
                                size: 15,
                              ),
                              Text(
                                "Abo Daby",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  // SvgPicture.asset(
                  //   AppAssets.support,
                  //   width: 90.w,
                  //   height: 90.w,
                  // ),
                  SvgPicture.asset(
                    AppAssets.notifications,
                    width: 80.w,
                    height: 80.w,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryTextField(
                        hintText: 'Search',
                        padding: EdgeInsets.zero,
                        fillColor: AppColors.white,
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
                    SvgPicture.asset(
                      AppAssets.filters,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Text(
                  "What do you want ?",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShortcutButton(
                      iconPath: AppAssets.sell,
                      label: 'sale',
                      onTap: () {
                        // showCreateAccountDialog(context, cubit);
                      },
                    ),
                    ShortcutButton(
                      iconPath: AppAssets.rent,
                      label: 'rent',
                      onTap: () {
                        // showCreateAccountDialog(context, cubit);
                      },
                    ),
                    ShortcutButton(
                      iconPath: AppAssets.commercial,
                      label: 'commercial',
                      onTap: () {
                        // showCreateAccountDialog(context, cubit);
                      },
                    ),
                    ShortcutButton(
                      iconPath: AppAssets.apartments,
                      label: 'Apartments',
                      onTap: () {
                        // showCreateAccountDialog(context, cubit);
                      },
                    ),
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

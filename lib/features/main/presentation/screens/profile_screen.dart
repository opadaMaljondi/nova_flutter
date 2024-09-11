// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/profile_header.dart';
import 'package:real_state/features/main/presentation/widgets/title_header.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/translations/local_keys.g.dart';
import '../widgets/box_profile_real_state.dart';
import '../widgets/properties_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white20,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    Text(
                      'User Name',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: AppColors.black,
                              ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.location,
                            color: AppColors.black,
                          ),
                          Text(
                            '  city - ',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'section - ',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'street ',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.phone,
                            fit: BoxFit.fill,
                            color: AppColors.black,
                          ),
                          Text(
                            ' +963 ',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            ' 0934225848',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const BoxProfileRealState(),
                    TitleHeader(
                      title: LocaleKeys.myRealSate.tr(),
                      onTap: () => context.push(AppRoutes.myRealStateScreen),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      shrinkWrap: true,
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.6,
                        crossAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          context.push(AppRoutes.propertiesDetails);
                        },
                        child: const PropertiesCard(
                          isFavorite: false,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
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

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/widgets/primary_icon_button.dart';
import '../../../../core/widgets/primary_image_picker.dart';
import '../widgets/box_profile_real_state.dart';
import '../widgets/properties_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(alignment: Alignment.center, children: [
              Positioned(
                top: -15.h,
                left: -110.w,
                right: -110.w,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                  decoration: BoxDecoration(
                      color: AppColors.materialPrimary,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.materialPrimary.shade400.withOpacity(0.6),
                            AppColors.materialPrimary.shade700.withOpacity(0.9),
                          ])),
                  height: 200.h,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PrimaryIconButton(
                            color: AppColors.white,
                            onPressed: () => context.pop(),
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: !context.canPop()
                                  ? AppColors.transparent
                                  : null,
                            ),
                          ),
                          SvgPicture.asset(AppAssets.editProfle),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 150.h,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.white20,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Column(children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Text(
                      'User Name',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: AppColors.black),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.phone,
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.location,
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
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Real State',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          InkWell(
                            onTap: () =>
                                context.push(AppRoutes.myRealStateScreen),
                            child: Text(
                              'show List',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color:
                                          AppColors.materialPrimary.shade700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 600.h,
                      child: GridView.builder(
                        physics:const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.6,
                                crossAxisSpacing: 15),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            context.push(AppRoutes.propertiesDetails);
                          },
                          child: const PropertiesCard(
                            isFavorite: false,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Positioned(top: 75.h, child: const PrimaryImagePicker()),
            ]),
          ],
        ),
      ),
    );
  }
}

/*



 */

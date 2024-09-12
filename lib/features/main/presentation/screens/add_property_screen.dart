import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/features/main/presentation/widgets/benifits_and_services.dart';
import 'package:real_state/features/main/presentation/widgets/details_property.dart';
import 'package:real_state/features/main/presentation/widgets/filters_.dart';
import 'package:real_state/features/main/presentation/widgets/pictures_and_files.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';
import 'package:real_state/features/main/presentation/widgets/property__type.dart';
import 'package:real_state/features/main/presentation/widgets/property_cassify.dart';
import 'package:real_state/features/main/presentation/widgets/property_info.dart';
import 'package:real_state/features/main/presentation/widgets/sings.dart';
import 'package:real_state/features/main/presentation/widgets/the_price.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryAppbar(
              title: LocaleKeys.add.tr(),
            ),
            Divider(
              thickness: 0.3,
              color: AppColors.mainGray,
              height: 30.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    padding: REdgeInsetsDirectional.all(30.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      border:
                          Border.all(color: AppColors.materialPrimary.shade500),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.youCanShareOnePost.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            LocaleKeys.upgradeToMerchant.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                PositionedDirectional(
                  start: 56.w,
                  top: -21.h,
                  child: SvgPicture.asset(
                    AppAssets.interrogative,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const PropertyType(),
            SizedBox(
              height: 15.h,
            ),
            const PropertyClassify(),
            SizedBox(
              height: 15.h,
            ),
            const Signs(),
            SizedBox(
              height: 30.h,
            ),
            const PropertyInfo(),
            SizedBox(
              height: 40.h,
            ),
            const DetailsProperty(),
            SizedBox(
              height: 40.h,
            ),
            const BenefitsAndServices(),
            SizedBox(
              height: 40.h,
            ),
            const PicturesAndFiles(),
            SizedBox(
              height: 40.h,
            ),
            const ThePrice(),
            SizedBox(
              height: 40.h,
            ),
            const Filters(),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}

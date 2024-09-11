import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Expanded(
            child: PrimaryTextField(
              hintText: LocaleKeys.search.tr(),
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
          GestureDetector(
            onTap: () {
              context.push(
                AppRoutes.filterShapeScreen,
              );
            },
            child: SvgPicture.asset(
              width: 50.w,
              height: 50.h,
              AppAssets.filters,
            ),
          ),
        ],
      ),
    );
  }
}

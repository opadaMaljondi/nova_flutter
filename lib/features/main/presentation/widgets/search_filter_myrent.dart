import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/translations/local_keys.g.dart';
import '../../../../core/widgets/primary_text_field.dart';

class SearchFilterMyRent extends StatelessWidget {
  const SearchFilterMyRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.filters,
          ),
          SizedBox(width: 5.w,),
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
          )
        ],
      ),
    );
  }
}

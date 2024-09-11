import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/features/main/presentation/widgets/custom_filter_chip.dart';

class SaleRentButtons extends StatelessWidget {
  const SaleRentButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomFilterChip(
          verticalPadding: 10.h,
          horizontalPadding: 57.w,
          label: LocaleKeys.saleCapital.tr(),
          isSelected: true,
          activeColor: AppColors.primary,
          onSelected: (value) {},
        ),
        SizedBox(
          width: 10.w,
        ),
        CustomFilterChip(
          verticalPadding: 10.h,
          horizontalPadding: 57.w,
          label: LocaleKeys.rentCapital.tr(),
          isSelected: false,
          activeColor: AppColors.primary,
          onSelected: (value) {},
        ),
      ],
    );
  }
}

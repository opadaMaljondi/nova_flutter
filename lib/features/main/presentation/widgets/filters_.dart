import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/features/main/presentation/widgets/custom_filter_chip.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  List<String> items = [
    'Abu Dhabi',
    'Rent',
    'Apartment',
    'City',
  ];
  @override
  bool isSelected=false;
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Divider(
                  color: AppColors.mainGray,
                ),
              ),
              Text(
                '  ${LocaleKeys.filters.tr()}  ',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.mainGray,
                    ),
              ),
              const Expanded(
                child: Divider(
                  color: AppColors.mainGray,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Wrap(
            children: List.generate(
              4,
              (index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: 5.w,
                    bottom: 5.h,
                  ),
                  child: CustomFilterChip(
                    label: items[index],
                    verticalPadding: 10.h,
                    horizontalPadding: 30.w,
                    isSelected: false,

                    activeColor: AppColors.primary,
                    borderSideColor: AppColors.black,
                    onSelected: (value) {},
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 45.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFilterChip(
                verticalPadding: 10.h,
                label: LocaleKeys.ignore.tr(),
                isSelected: isSelected,
                activeColor: AppColors.primary,
                onSelected: (value) { setState(() {
                  isSelected = !isSelected;
                });},
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomFilterChip(
                verticalPadding: 10.h,
                label: LocaleKeys.add.tr(),
                isSelected: !isSelected,
                activeColor: AppColors.primary,
                onSelected: (value) { setState(() {
                  isSelected = !isSelected;
                });},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

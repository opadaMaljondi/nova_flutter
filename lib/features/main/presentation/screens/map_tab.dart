import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/main/presentation/widgets/custom_filter_chip.dart';

class MapTab extends StatefulWidget {
  const MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  bool isRent = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.black30,
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: PrimaryTextField(
                            labelText: LocaleKeys.searchOnMap.tr(),
                            hintText: LocaleKeys.search.tr(),
                            padding: EdgeInsets.zero,
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    CustomFilterChip(
                      label: LocaleKeys.rentCapital.tr(),
                      isSelected: isRent,
                      activeColor: AppColors.primary,
                      onSelected: (value) {
                        setState(() {
                          isRent = value;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomFilterChip(
                      label: LocaleKeys.saleCapital.tr(),
                      isSelected: !isRent,
                      activeColor: AppColors.primary,
                      onSelected: (value) {
                        setState(() {
                          isRent = !value;
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

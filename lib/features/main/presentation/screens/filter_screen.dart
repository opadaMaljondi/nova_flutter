import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/core/widgets/primary_button.dart';
import 'package:real_state/features/main/presentation/widgets/drop_down_date_picker.dart';
import 'package:real_state/features/main/presentation/widgets/maney_range_slider.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';
import 'package:real_state/features/main/presentation/widgets/sale_rent_buttons.dart';
import 'package:real_state/features/main/presentation/widgets/write_list_view.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryAppbar(
                title: LocaleKeys.filter.tr(),
              ),
              Divider(
                thickness: 1,
                color: AppColors.mainGray,
                height: 30.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              const SaleRentButtons(),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20.w),
                child: Text(
                  LocaleKeys.type.tr(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.black5,
                      ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 123.h,
                child: const WriteListView(),
              ),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20.w),
                child: Text(
                  LocaleKeys.rangFromTo.tr(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.black5,
                      ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const MoneyRangeSlider(),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20.w),
                child: Text(
                  LocaleKeys.date.tr(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.black5,
                      ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const DropDownDatPicker(),
              SizedBox(
                height: 120.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        margin: EdgeInsets.zero,
                        label: LocaleKeys.back.tr(),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: PrimaryButton(
                        label: LocaleKeys.apply.tr(),
                        margin: EdgeInsets.zero,
                        disabledButtonColor: AppColors.primary,
                      ),
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

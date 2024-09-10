import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_colors.dart';
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
              const PrimaryAppbar(
                title: 'filter',
              ),
              Divider(
                thickness: 0.3,
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
                  'Write',
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
                  'Ranges from to',
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
                  'date',
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
                height: 100.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        margin: EdgeInsets.zero,
                        label: 'Back',
                        onPressed: () => context.pop(),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: PrimaryButton(
                        label: 'Application',
                        margin: EdgeInsets.zero,
                        onPressed: () => context.pop(),
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

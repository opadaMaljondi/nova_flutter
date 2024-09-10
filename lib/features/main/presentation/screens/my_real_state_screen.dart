import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/features/main/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';
import 'package:real_state/injection_container.dart';

import '../../../../core/constants/app_colors.dart';
import '../widgets/card_filter.dart';
import '../widgets/search_filter_myrent.dart';

class MyRealStateScreen extends StatelessWidget {
  const MyRealStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white30,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PrimaryAppbar(title: 'My Rent'),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: const SearchFilterMyRent(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: BlocBuilder<MainCubit, MainState>(
                  builder: (context, state) {
                    MainCubit cubit = InjectionContainer.getIt<MainCubit>();
                    return state.maybeWhen(
                        orElse: () => Container(),
                        changeTabSuccess: () => Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      children: List.generate(
                                    cubit.filterTypes.length,
                                    (index) => InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        context.read<MainCubit>().selectFilter(index);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                                        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 18.w),
                                        decoration: BoxDecoration(
                                            color: index == filterIndex ? AppColors.primary : AppColors.white,
                                            borderRadius: BorderRadius.circular(20.r)),
                                        child: Text(
                                          '  Not ٌRented',
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                color: index == filterIndex ? AppColors.white : AppColors.primary,
                                              ),
                                        ),
                                      ),
                                    ),
                                  )),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                ...List.generate(
                                  8,
                                  (index) => const CardFilter(),
                                )
                              ],
                            ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

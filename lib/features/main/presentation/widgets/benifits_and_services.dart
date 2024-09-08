import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/main/presentation/widgets/custom_filter_chip.dart';

class BenefitsAndServices extends StatefulWidget {
  const BenefitsAndServices({super.key});

  @override
  State<BenefitsAndServices> createState() => _BenefitsAndServicesState();
}

class _BenefitsAndServicesState extends State<BenefitsAndServices> {
  late TextEditingController dialogController;
  List<String> items = [
    'Internet',
    'elevator',
    'Furnished',
    'Surveillance cameras',
    'swimming pool',
    'garden',
  ];

  @override
  void initState() {
    super.initState();
    dialogController = TextEditingController();
  }

  @override
  void dispose() {
    dialogController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Divider(color: AppColors.mainGray),
              ),
              Text(
                '  Benefits and services  ',
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
            children: [
              Wrap(
                children: List.generate(
                  items.length,
                  (index) {
                    return Padding(
                      padding: EdgeInsetsDirectional.only(
                        end: 5.w,
                        bottom: 5.h,
                      ),
                      child: CustomFilterChip(
                        verticalPadding: 10.h,
                        horizontalPadding: 30.w,
                        label: items[index],
                        isSelected: false,
                        activeColor: AppColors.primary,
                        borderSideColor: AppColors.black,
                        borderWidth: 2,
                        onSelected: (value) {},
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        insetPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(16.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Enter a service',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              PrimaryTextField(
                                padding: EdgeInsets.zero,
                                controller: dialogController,
                                fillColor: AppColors.grayAccent,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      items.add(dialogController.text);
                                    });
                                    GoRouter.of(context).pop();
                                  },
                                  child: Container(
                                    height: 50.h,
                                    width: .5.sw,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 12.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    child: Text(
                                      'Add',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 45.h,
                  width: 134.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      color: AppColors.gray,
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.gray,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

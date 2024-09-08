import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class ExpandedChipFilter extends StatelessWidget {
  const ExpandedChipFilter({
    super.key,
    this.backgroundColor1,
    this.borderSideColor1,
    this.labelColor1,
    required this.label1,
    this.backgroundColor2,
    this.borderSideColor2,
    this.labelColor2,
    required this.label2,
    required this.onTap1,
    required this.onTap2,
    this.isSelected1,
    this.isSelected2,
    this.borderRadius,
  });

  final Color? backgroundColor1;
  final Color? borderSideColor1;
  final Color? labelColor1;
  final String label1;
  final void Function() onTap1;
  final bool? isSelected1;

  final Color? backgroundColor2;
  final Color? borderSideColor2;
  final Color? labelColor2;
  final String label2;
  final void Function() onTap2;
  final bool? isSelected2;

  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onTap1,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: isSelected1 == true
                        ? const Color(0xff3C82AA)
                        : Colors.white,
                    borderRadius: borderRadius ?? BorderRadius.circular(10.r),
                    border: Border.all(
                      color: isSelected1 == true
                          ? AppColors.transparent
                          : AppColors.black,
                    ),
                  ),
                  child: Text(
                    label1,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: isSelected1 == true
                              ? Colors.white
                              : AppColors.black,
                        ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: GestureDetector(
                onTap: onTap2,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: isSelected2 == true
                        ? const Color(0xff3C82AA)
                        : Colors.white,
                    borderRadius: borderRadius ?? BorderRadius.circular(10.r),
                    border: Border.all(
                      color: isSelected2 == true
                          ? AppColors.transparent
                          : AppColors.black,
                    ),
                  ),
                  child: Text(
                    label2,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: isSelected2 == true
                              ? Colors.white
                              : AppColors.black,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

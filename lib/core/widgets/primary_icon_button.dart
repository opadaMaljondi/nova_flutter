import 'package:real_state/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryIconButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? splashColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;

  const PrimaryIconButton({
    required this.child,
    this.color,
    this.splashColor,
    this.onPressed,
    super.key,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(10.r),
        color: color ?? AppColors.black30,
      ),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: onPressed,
          splashColor: splashColor,
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          child: Container(
            padding: padding ?? EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(5.r),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

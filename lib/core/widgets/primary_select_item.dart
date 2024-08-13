import 'package:real_state/core/constants/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimarySelectItem<T> extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool isExpanded;
  final bool readOnly;
  final List<DropdownMenuItem<T>> items;
  final T? selectedItem;
  final void Function(T? value)? onChanged;
  final Widget? suffixIcon;
  final Color fillColor;
  final EdgeInsetsGeometry? padding;

  const PrimarySelectItem({
    super.key,
    this.labelText,
    this.hintText,
    this.readOnly = false,
    required this.onChanged,
    required this.items,
    required this.selectedItem,
    this.suffixIcon,
    this.fillColor = AppColors.black30,
    this.padding,
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...[
            Text(
              labelText!,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
          DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              isExpanded: isExpanded,
              hint: hintText != null
                  ? Text(
                      hintText!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  : null,
              items: items,
              value: selectedItem,
              onChanged: readOnly ? null : onChanged,
              iconStyleData: IconStyleData(
                icon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: suffixIcon ??
                      const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.gray,
                      ),
                ),
              ),
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

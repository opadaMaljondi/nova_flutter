import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/widgets/expanded_chip_filter.dart';

class PropertyType extends StatefulWidget {
  const PropertyType({super.key});

  @override
  State<PropertyType> createState() => _PropertyTypeState();
}

class _PropertyTypeState extends State<PropertyType> {
  bool isSelected1 = true;
  bool isSelected2 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Property type',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          ExpandedChipFilter(
            label1: "sale",
            label2: 'Rent',
            isSelected1: isSelected1,
            isSelected2: isSelected2,
            onTap1: () {
              setState(() {
                isSelected1 = true;
                isSelected2 = false;
              });
            },
            onTap2: () {
              setState(() {
                isSelected1 = false;
                isSelected2 = true;
              });
            },
          ),
        ],
      ),
    );
  }
}

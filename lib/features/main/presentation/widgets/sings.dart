import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/widgets/expanded_chip_filter.dart';

class Signs extends StatefulWidget {
  const Signs({super.key});

  @override
  State<Signs> createState() => _SignsState();
}

class _SignsState extends State<Signs> {
  bool isSelected1 = true;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'signs',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          ExpandedChipFilter(
            label1: "commercial",
            label2: 'residential',
            isSelected1: isSelected1,
            isSelected2: isSelected2,
            onTap1: () {
              setState(() {
                isSelected1 = true;
                isSelected2 = false;
                isSelected3 = false;
                isSelected4 = false;
              });
            },
            onTap2: () {
              setState(() {
                isSelected1 = false;
                isSelected2 = true;
                isSelected3 = false;
                isSelected4 = false;
              });
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          ExpandedChipFilter(
            label1: "agricultural",
            label2: 'industrial',
            isSelected1: isSelected3,
            isSelected2: isSelected4,
            onTap1: () {
              setState(() {
                isSelected1 = false;
                isSelected2 = false;
                isSelected3 = true;
                isSelected4 = false;
              });
            },
            onTap2: () {
              setState(() {
                isSelected1 = false;
                isSelected2 = false;
                isSelected3 = false;
                isSelected4 = true;
              });
            },
          ),
        ],
      ),
    );
  }
}

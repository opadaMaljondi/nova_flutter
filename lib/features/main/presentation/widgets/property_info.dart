import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';

class PropertyInfo extends StatelessWidget {
  const PropertyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Property name',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          PrimaryTextField(
            padding: EdgeInsets.zero,
            fillColor: const Color(0xffD1D8DB).withOpacity(.34),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Property address',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          PrimaryTextField(
            padding: EdgeInsets.zero,
            fillColor: const Color(0xffD1D8DB).withOpacity(.34),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'City',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          PrimaryTextField(
            padding: EdgeInsets.zero,
            fillColor: const Color(0xffD1D8DB).withOpacity(.34),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Description',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          PrimaryTextField(
            padding: EdgeInsets.zero,
            fillColor: const Color(0xffD1D8DB).withOpacity(.34),
            maxLines: 5,
            minLines: 5,
          ),
        ],
      ),
    );
  }
}

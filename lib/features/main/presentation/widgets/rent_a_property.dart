import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RentAproperty extends StatelessWidget {
  const RentAproperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 21.w),
          child: Text(
            'Rent a property',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 11.h,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 21.w,
            end: 13.w,
          ),
          child: Text(
            'Rental properties can be a steady source of passive income. This option is often preferred by those who are not in a hurry to liquidate their assets and want to benefit from constant cash flow. Landlords can benefit from rental income, which can cover mortgage payments, taxes and maintenance costs, often leaving them with a profit. Additionally, real estate may appreciate in value over time, increasing the owner\'s equity.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

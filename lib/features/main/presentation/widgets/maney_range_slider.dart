import 'package:flutter/material.dart';
import 'package:real_state/core/constants/app_colors.dart';

class MoneyRangeSlider extends StatefulWidget {
  const MoneyRangeSlider({
    super.key,
  });

  @override
  State<MoneyRangeSlider> createState() => _MoneyRangeSliderState();
}

class _MoneyRangeSliderState extends State<MoneyRangeSlider> {
  int lowerValue = 1500;
  int higherValue = 4500;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          min: 1000,
          max: 10000,
          inactiveColor: AppColors.grayAccent,
          activeColor: AppColors.primary,
          values: RangeValues(lowerValue.toDouble(), higherValue.toDouble()),
          labels: RangeLabels(lowerValue.toString(), higherValue.toString()),
          onChanged: (value) {
            setState(() {
              lowerValue = value.start.toInt();
              higherValue = value.end.toInt();
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "$lowerValue \$",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.gray,
                  ),
            ),
            Text(
              "$higherValue \$",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.gray,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}

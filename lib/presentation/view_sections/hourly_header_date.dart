import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HourlyHeaderWithDate extends StatelessWidget {
  const HourlyHeaderWithDate({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          'Today',
          style: isTabletPortrait(context)
              ? textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.normal)
              : textTheme.headlineMedium,
        ),
        Text(
          'May 27, 2025',
          style: textTheme.titleSmall?.copyWith(
            color: Colors.white,
            fontSize: isPhoneLandscape(context) ? 30 : 15.sp,
            //fontWeight: FontWeight.w100,
          ),
        ),
      ],
    );
  }
}

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
          style: textTheme.headlineSmall?.copyWith(
            fontSize: isTabletPortrait(context) ? 35.sp : null,
          ),
        ),
        Text(
          'May 27, 2025',
          style: textTheme.titleSmall?.copyWith(
            color: Colors.white,
            fontSize: isTabletPortrait(context) ? 24.sp : null,
            //fontWeight: FontWeight.w100,
          ),
        ),
      ],
    );
  }
}

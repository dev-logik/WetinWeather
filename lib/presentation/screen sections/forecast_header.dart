import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NextForecastHeader extends StatelessWidget {
  const NextForecastHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          'Next Forcast',
          style: isTabletPortrait(context)
              ? textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w100,
                  fontSize: 18.sp,
                )
              : textTheme.headlineSmall,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.calendar,
            size: isPhoneLandscape(context) ? 15.sp : 16.sp,
          ),
          padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.0.w),
        ),
      ],
    );
  }
}

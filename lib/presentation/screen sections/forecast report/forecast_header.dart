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
          style: textTheme.headlineSmall?.copyWith(
            fontSize: isTabletPortrait(context) ? 35.sp : null,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.calendar,
            size: isTabletPortrait(context) ? 32.sp : 24.sp,
          ),
          padding: EdgeInsets.all(8.0.dg),
        ),
      ],
    );
  }
}

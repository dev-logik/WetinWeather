import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          'San Francisco',
          style: textTheme.headlineLarge?.copyWith(
            fontSize: isTabletPortrait(context) ? 70.sp : null,
          ),
        ),
        sizedH8,
        //Todo: Pass dynamic date string.
        Text(
          'May 27, 2025',
          style: textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w100,
            fontSize: isTabletPortrait(context) ? 25.sp : null,
          ),
        ),
      ],
    );
  }
}

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
          style: isTabletPortrait(context)
              ? textTheme.headlineLarge?.copyWith(fontSize: 30.sp)
              : textTheme.headlineLarge,
        ),
        sizedH8,
        //Todo: Pass dynamic date string.
        Text(
          'May 27, 2025',
          style: isTabletPortrait(context)
              ? textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                )
              : textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w100,
                ),
        ),
      ],
    );
  }
}

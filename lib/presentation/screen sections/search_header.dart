import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Page Header name
        Text(
          'Pick Location',
          style: isTabletLandscape(context)
              ? textTheme.headlineLarge?.copyWith(fontSize: 15.sp)
              : textTheme.headlineLarge,
        ),
        sizedH8,
        Text(
          'Find the area or city that you want to know the detailed weather info at this time.',
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w100,
            fontSize: setLandscapeValues(
              ifTrue: 8.0.sp,
              ifFalse: 15.0.sp,
              context: context,
            ),
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

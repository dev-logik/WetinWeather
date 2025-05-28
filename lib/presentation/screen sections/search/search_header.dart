import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc_app/utilities/orientation_helpers.dart';
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
          style: textTheme.headlineLarge?.copyWith(
            fontSize:
                isTabletPortrait(context)
                    ? 70.sp
                    : isTabletLandscape(context)
                    ? 70.sp
                    : null,
          ),
        ),
        sizedH8,
        AutoSizeText(
          textScaleFactor: 1.2.sp,
          'Find the area or city that you want to know the detailed weather info at this time.',
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w100,
            fontSize:
                isTabletPortrait(context)
                    ? 25.sp
                    : isTabletLandscape(context)
                    ? 24.sp
                    : null,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

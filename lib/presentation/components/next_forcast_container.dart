import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NextForcastCard extends StatelessWidget {
  const NextForcastCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.w),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.0.h),
          child: ListTile(
            dense: false,
            contentPadding: REdgeInsets.symmetric(
                vertical: isTabletLandscape(context) ? 10 : 8),
            visualDensity: VisualDensity.comfortable,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Friday',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: isPhoneLandscape(context)
                        ? 8.sp
                        : isTabletPortrait(context)
                            ? 10.sp
                            : isTabletLandscape(context)
                                ? 6.sp
                                : 18.sp,
                  ),
                ),
                Text(
                  'May, 28',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w100,
                    fontSize: isPhoneLandscape(context)
                        ? 7.sp
                        : isTabletPortrait(context)
                            ? 6.sp
                            : isTabletLandscape(context)
                                ? 6.sp
                                : 14.sp,
                  ),
                ),
              ],
            ),
            titleAlignment: ListTileTitleAlignment.center,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '30',
                  style: textTheme.displayMedium,
                ),
                Text(
                  '°C',
                  style: textTheme.displayMedium,
                )
              ],
            ),
            trailing: Lottie.asset(
              AssetPath.animatedSnowy,
              width: 50.w,
              height: 50.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NextForecastCard extends StatelessWidget {
  const NextForecastCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.w),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 16.0.h),
          child: ListTile(
            dense: false,
            contentPadding: REdgeInsets.symmetric(
              vertical: isTabletLandscape(context) ? 10 : 8,
            ),
            visualDensity: VisualDensity.comfortable,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Friday',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize:
                        isPhoneLandscape(context)
                            ? 8.sp
                            : isTabletPortrait(context)
                            ? 23.sp
                            : isTabletLandscape(context)
                            ? 5.sp
                            : 18.sp,
                  ),
                ),
                Text(
                  'May, 28',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w100,
                    fontSize:
                        isPhoneLandscape(context)
                            ? 7.sp
                            : isTabletPortrait(context)
                            ? 14.sp
                            : isTabletLandscape(context)
                            ? 4.sp
                            : 14.sp,
                  ),
                ),
              ],
            ),
            titleAlignment: ListTileTitleAlignment.center,
            title: Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: '30',
                  style: textTheme.displayMedium,
                  children: <InlineSpan>[
                    TextSpan(
                      text: ' °C',
                      style: textTheme.titleMedium?.copyWith(
                        fontSize: isTabletPortrait(context) ? 27.sp : 16.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            trailing: displayAnimation(),
          ),
        ),
      ),
    );
  }

  AspectRatio displayAnimation() {
    return AspectRatio(
      aspectRatio: 5 / 4,
      child: Lottie.asset(
        AssetPath.animatedSnowy,
        width: 40.w,
        height: 40.h,
        fit: BoxFit.cover,
      ),
    );
  }
}

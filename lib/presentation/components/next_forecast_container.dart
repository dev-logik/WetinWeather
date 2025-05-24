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
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 24.0.h),
          child: ListTile(
            dense: false,
            visualDensity: VisualDensity.comfortable,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Friday',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize:
                        isPhoneLandscape(context) ||
                                isTabletPortrait(context) ||
                                isTabletLandscape(context)
                            ? 23.sp
                            : 18.sp,
                  ),
                ),
                Text(
                  'May, 28',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w100,
                    fontSize: isTabletLandscape(context) ? 14.sp.sp : 14.sp,
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
                  style: textTheme.displayMedium?.copyWith(
                    fontSize:
                        isPhoneLandscape(context)
                            ? 60.sp
                            : isTabletLandscape(context)
                            ? 50.sp
                            : null,
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: ' °C',
                      style: textTheme.titleMedium?.copyWith(
                        fontSize:
                            isTabletPortrait(context)
                                ? 27.sp
                                : isTabletLandscape(context) ||
                                    isPhoneLandscape(context)
                                ? 35.sp
                                : 18.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            trailing: displayAnimation(context),
          ),
        ),
      ),
    );
  }

  AspectRatio displayAnimation(BuildContext context) {
    return AspectRatio(
      aspectRatio: isPhoneLandscape(context) ? 5 / 3 : 5 / 4,
      child: Lottie.asset(
        AssetPath.animatedSnowy,
        width: 40.w,
        height: 40.h,
        fit: BoxFit.cover,
      ),
    );
  }
}

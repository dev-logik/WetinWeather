import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HourlyReportCard extends StatelessWidget {
  const HourlyReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth:
            isTabletLandscape(context)
                ? 0.26.sw
                : isPhoneLandscape(context)
                ? 0.20.sw
                : 0.45.sw,
        maxHeight:
            isTabletLandscape(context)
                ? 0.40.sh
                : isPhoneLandscape(context)
                ? .30.sh
                : 0.30.sh,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 0, right: 0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                displayAnimation(context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    displayTime(context, textTheme),
                    sizedH4,
                    displayTemp(textTheme, context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RichText displayTemp(TextTheme textTheme, BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '30',
        style: textTheme.titleLarge?.copyWith(
          fontSize:
              isTabletPortrait(context)
                  ? 40.sp
                  : isTabletLandscape(context)
                  ? 40.sp
                  : isPhoneLandscape(context)
                  ? 28.sp
                  : 24.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: ' °C',
            style: textTheme.titleLarge?.copyWith(
              fontSize:
                  isTabletPortrait(context)
                      ? 30.sp
                      : isTabletLandscape(context)
                      ? 28.sp
                      : isPhoneLandscape(context)
                      ? 18.sp
                      : 15.sp,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Text displayTime(BuildContext context, TextTheme textTheme) {
    return Text(
      '15:00',
      style: textTheme.titleLarge?.copyWith(
        color: Colors.white,
        fontSize:
            isTabletPortrait(context)
                ? 40.sp
                : isTabletLandscape(context)
                ? 35.sp
                : null,
      ),
    );
  }

  AspectRatio displayAnimation(BuildContext context) {
    return AspectRatio(
      aspectRatio: isTabletPortrait(context) ? 5 / 4 : 1,
      child: Lottie.asset(
        AssetPath.animatedCloudyLighting,
        width: 50,
        height: 50,
        fit: BoxFit.contain,
      ),
    );
  }
}

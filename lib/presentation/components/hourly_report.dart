import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
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
        maxWidth: isTabletLandscape(context)
            ? 0.26.sw
            : isPhoneLandscape(context)
                ? 0.20.sw
                : 0.5.sw,
        maxHeight: isTabletLandscape(context)
            ? 0.40.sh
            : isPhoneLandscape(context)
                ? 0.20.sh
                : 0.3.sh,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 16,
            left: 0,
            right: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  RichText displayTemp(TextTheme textTheme, BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '30',
        style: textTheme.bodyMedium?.copyWith(
          fontSize: isTabletPortrait(context)
              ? 20.sp
              : isPhoneLandscape(context)
                  ? 10.sp
                  : isTabletLandscape(context)
                      ? 15.sp
                      : 20.sp,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: '°C',
            style: textTheme.bodyMedium?.copyWith(
              fontSize: isTabletPortrait(context)
                  ? 20.sp
                  : isPhoneLandscape(context)
                      ? 10.sp
                      : isTabletLandscape(context)
                          ? 15.sp
                          : 20.sp,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Text displayTime(BuildContext context, TextTheme textTheme) {
    return Text(
      '15:00',
      style: isTabletPortrait(context)
          ? textTheme.titleMedium?.copyWith(fontSize: 15.sp)
          : isTabletLandscape(context)
              ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
              : isPhoneLandscape(context)
                  ? textTheme.bodySmall?.copyWith(fontSize: 7.sp)
                  : textTheme.titleMedium,
    );
  }

  AspectRatio displayAnimation(BuildContext context) {
    return AspectRatio(
      aspectRatio: isTabletPortrait(context) ? 5 / 4 : 1,
      child: Lottie.asset(
        AssetPath.animatedSnowy,
        width: 50,
        height: 50,
        fit: BoxFit.contain,
      ),
    );
  }
}

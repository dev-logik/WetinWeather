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
        maxWidth: setLandscapeValues(
          ifTrue: isTabletLandscape(context) ? 0.26.sw : .20.sw,
          ifFalse: 150.0.w,
          context: context,
        ),
        maxHeight: setLandscapeValues(
          ifTrue: .40.sh,
          ifFalse: 150.0.h,
          context: context,
        ),
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
              AspectRatio(
                aspectRatio: isTabletPortrait(context) ? 5 / 4 : 1,
                child: Lottie.asset(
                  AssetPath.animatedSnowy,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '15:00',
                    style: isTabletPortrait(context)
                        ? textTheme.titleMedium?.copyWith(fontSize: 15.sp)
                        : isTabletLandscape(context)
                            ? textTheme.titleMedium?.copyWith(fontSize: 8.sp)
                            : isPhoneLandscape(context)
                                ? textTheme.bodySmall?.copyWith(fontSize: 7.sp)
                                : textTheme.titleMedium,
                  ),
                  sizedH4,
                  RichText(
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
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

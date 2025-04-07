import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SearchHistoryCard extends StatelessWidget {
  const SearchHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: setLandscapeValues(
          ifTrue: 104.w,
          ifFalse: isTabletPortrait(context) ? 150.0.w : 200.0.w,
          context: context,
        ),
        maxHeight: setLandscapeValues(
          ifTrue: 200.h,
          ifFalse: 100.h,
          context: context,
        ),
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '30',
                      style: isTabletPortrait(context)
                          ? textTheme.titleMedium?.copyWith(fontSize: 15.sp)
                          : isPhoneLandscape(context)
                              ? textTheme.titleMedium?.copyWith(fontSize: 10.sp)
                              : textTheme.titleMedium
                                  ?.copyWith(fontSize: 24.sp),
                      children: <InlineSpan>[
                        TextSpan(
                          text: '°C',
                          style: isTabletPortrait(context)
                              ? textTheme.titleMedium?.copyWith(fontSize: 15.sp)
                              : isPhoneLandscape(context)
                                  ? textTheme.titleMedium
                                      ?.copyWith(fontSize: 10.sp)
                                  : textTheme.titleMedium
                                      ?.copyWith(fontSize: 24.sp),
                        ),
                      ],
                    ),
                  ),
                  //Weather condition
                  Text(
                    'Cloudy',
                    style: isTabletPortrait(context)
                        ? textTheme.titleMedium?.copyWith(fontSize: 10.sp)
                        : isPhoneLandscape(context)
                            ? textTheme.titleSmall?.copyWith(fontSize: 8.sp)
                            : textTheme.titleSmall?.copyWith(fontSize: 15.sp),
                  ),
                  sizedH4,
                  //Displays the city
                  Align(
                    child: Text(
                      'New York',
                      style: isTabletPortrait(context)
                          ? textTheme.titleMedium?.copyWith(fontSize: 10.sp)
                          : isPhoneLandscape(context)
                              ? textTheme.titleSmall?.copyWith(fontSize: 8.sp)
                              : textTheme.titleSmall?.copyWith(fontSize: 18.sp),
                    ),
                  ),
                ],
              ),
              Lottie.asset(AssetPath.animatedCloudyWindy,
                  width: setLandscapeValues(
                    ifTrue: 50.0.w,
                    ifFalse: 80.0.w,
                    context: context,
                  ),
                  height: setLandscapeValues(
                    ifTrue: 50.0.w,
                    ifFalse: 80.0.w,
                    context: context,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

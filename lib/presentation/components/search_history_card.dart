import 'package:bloc_app/utilities/utilities.dart';
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
        maxWidth:
            isTabletPortrait(context)
                ? .35.sw
                : isPhoneLandscape(context)
                ? .3.sw
                : isTabletLandscape(context)
                ? .25.sw
                : .5.sw,
        maxHeight:
            isPhoneLandscape(context)
                ? .3.sh
                : isTabletLandscape(context)
                ? .22.sh
                : .12.sh,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '30',
                      style: textTheme.titleLarge?.copyWith(
                        fontSize:
                            isTabletPortrait(context)
                                ? 35.sp
                                : isTabletLandscape(context)
                                ? 40.sp
                                : 24.sp,
                        color: Colors.white,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: '°C',
                          style: textTheme.titleLarge?.copyWith(
                            fontSize:
                                isTabletPortrait(context)
                                    ? 30.sp
                                    : isTabletLandscape(context)
                                    ? 25.sp
                                    : 20.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Weather condition
                  Text(
                    'Cloudy',
                    style: textTheme.titleMedium?.copyWith(
                      fontSize:
                          isTabletPortrait(context)
                              ? 26.sp
                              : isTabletLandscape(context)
                              ? 30.sp
                              : 20.sp,
                    ),
                  ),
                  sizedH4,
                  //Displays the city
                  Align(
                    child: Text(
                      'New York',
                      style: textTheme.titleSmall?.copyWith(
                        fontSize:
                            isTabletPortrait(context)
                                ? 18.sp
                                : isPhoneLandscape(context)
                                ? 16.sp
                                : isTabletLandscape(context)
                                ? 20.sp
                                : 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
              sizedW4,
              AspectRatio(
                aspectRatio: isTabletPortrait(context) ? 5 / 4 : 1,
                child: Lottie.asset(
                  AssetPath.animatedCloudyWindy,
                  width: setLandscapeValues(
                    ifTrue: 30.0.w,
                    ifFalse: 80.0.w,
                    context: context,
                  ),
                  height: setLandscapeValues(
                    ifTrue: 30.0.h,
                    ifFalse: 80.0.h,
                    context: context,
                  ),
                  fit:
                      isTabletLandscape(context)
                          ? BoxFit.cover
                          : BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

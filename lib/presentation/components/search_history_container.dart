import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:bloc_app/utilities/helper_funtions.dart';
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
          ifTrue: 100.w,
          ifFalse: isTablet(context) ? 150.w : 200.0.w,
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
                      style: isTablet(context)
                          ? textTheme.titleLarge?.copyWith(color: Colors.white)
                          : textTheme.titleMedium,
                      children: <InlineSpan>[
                        TextSpan(
                          text: ' °C',
                          style: textTheme.titleLarge
                              ?.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  //Weather condition
                  Text(
                    'Cloudy',
                    style: textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  //Displays the city
                  Align(
                    child: Text(
                      'New York',
                      style: textTheme.titleSmall,
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

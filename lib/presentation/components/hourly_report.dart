import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:bloc_app/utilities/helper_funtions.dart';
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
          ifTrue: .20.sw,
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
          padding:
              const EdgeInsets.only(top: 16, bottom: 16, left: 0, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Lottie.asset(
                AssetPath.animatedSnowy,
                width: isTablet(context) ? 100 : 70,
                height: isTablet(context) ? 100 : 70,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '15:00',
                    style: isTablet(context)
                        ? textTheme.titleMedium
                        : textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: isTablet(context) ? 2 : 4,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '30',
                      style: textTheme.titleMedium,
                      children: <InlineSpan>[
                        TextSpan(
                          text: '°C',
                          style: textTheme.titleMedium,
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

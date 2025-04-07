import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class ForcastSummary extends StatelessWidget {
  const ForcastSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      key: const ValueKey(0),
      constraints: BoxConstraints(
        minHeight: 0.45.sh,
        minWidth: 0.4.sw,
        maxWidth: 0.95.sw,
        maxHeight: 0.48.sh,
      ),
      child: Card(
        color: Color.fromRGBO(225, 225, 225, 225),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: isTabletPortrait(context) ? 5 / 3 : 4 / 3,
              child: Lottie.asset(
                AssetPath.animatedCloudy,
                height: 300.h,
                width: 300.w,
                fit: BoxFit.contain,
              ),
            ),
            isTabletPortrait(context) ? Container() : sizedH32,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Todo: Check if an icon can replace this.
                    //Todo: the values will be passed dynamically.
                    FaIcon(
                      FontAwesomeIcons.temperatureHigh,
                      size: isTabletPortrait(context) ? 10.dg : null,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '33',
                        style: isTabletPortrait(context)
                            ? textTheme.titleMedium?.copyWith(fontSize: 12.sp)
                            : textTheme.titleMedium?.copyWith(fontSize: 24.sp),
                        children: <InlineSpan>[
                          TextSpan(
                            text: '°C',
                            style: isTabletPortrait(context)
                                ? textTheme.titleMedium
                                    ?.copyWith(fontSize: 12.sp)
                                : textTheme.titleMedium
                                    ?.copyWith(fontSize: 24.sp),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Temperature',
                      style: isTabletPortrait(context)
                          ? textTheme.bodyLarge?.copyWith(fontSize: 9.sp)
                          : null,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Todo: Check if an icon can replace this.
                    //Todo: the values will be passed dynamically.
                    FaIcon(
                      FontAwesomeIcons.wind,
                      size: isTabletPortrait(context) ? 10.dg : null,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '3',
                        style: isTabletPortrait(context)
                            ? textTheme.titleMedium?.copyWith(fontSize: 12.sp)
                            : textTheme.titleMedium?.copyWith(fontSize: 24.sp),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'm/s',
                            style: isTabletPortrait(context)
                                ? textTheme.titleMedium
                                    ?.copyWith(fontSize: 12.sp)
                                : textTheme.titleMedium
                                    ?.copyWith(fontSize: 24.sp),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Wind',
                      style: isTabletPortrait(context)
                          ? textTheme.bodyLarge?.copyWith(fontSize: 9.sp)
                          : null,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Todo: Check if an icon can replace this.
                    //Todo: the values will be passed dynamically.
                    FaIcon(
                      FontAwesomeIcons.droplet,
                      size: isTabletPortrait(context) ? 10.dg : null,
                    ),

                    RichText(
                      text: TextSpan(
                        text: '3',
                        style: isTabletPortrait(context)
                            ? textTheme.titleMedium?.copyWith(fontSize: 12.sp)
                            : textTheme.titleMedium?.copyWith(fontSize: 24.sp),
                        children: <InlineSpan>[
                          TextSpan(
                            text: '%',
                            style: isTabletPortrait(context)
                                ? textTheme.titleMedium
                                    ?.copyWith(fontSize: 12.sp)
                                : textTheme.titleMedium
                                    ?.copyWith(fontSize: 24.sp),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Humidity',
                      style: isTabletPortrait(context)
                          ? textTheme.bodyLarge?.copyWith(fontSize: 9.sp)
                          : null,
                    ),
                  ],
                )
              ],
            ),
            sizedH4
          ],
        ),
      ),
    );
  }
}

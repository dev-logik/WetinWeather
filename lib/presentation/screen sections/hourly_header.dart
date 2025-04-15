import 'package:bloc_app/utilities/color_constants.dart';
import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HourlyHeader extends StatelessWidget {
  const HourlyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Today',
                style: isTabletPortrait(context)
                    ? textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w100,
                        fontSize: 18.sp,
                      )
                    : textTheme.headlineSmall,
              ),
              InkWell(
                child: Text(
                  'View full report',
                  style: isTabletPortrait(context)
                      ? textTheme.headlineSmall?.copyWith(
                          color:
                              (Theme.of(context).brightness == Brightness.light)
                                  ? LightColorConstants.secondaryColor_1
                                  : DarkColorConstants.secondaryColor_1,
                        )
                      : textTheme.labelSmall?.copyWith(
                          color:
                              (Theme.of(context).brightness == Brightness.light)
                                  ? LightColorConstants.secondaryColor_1
                                  : DarkColorConstants.secondaryColor_1,
                        ),
                ),
                //Todo: Implement the onTap function.
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}

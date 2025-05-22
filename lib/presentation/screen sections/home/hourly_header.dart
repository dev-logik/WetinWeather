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
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Today',
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: isTabletPortrait(context) ? 35.sp : null,
                ),
              ),
              InkWell(
                child: Text(
                  'View full report',
                  style: textTheme.labelSmall?.copyWith(
                    color:
                        (Theme.of(context).brightness == Brightness.light)
                            ? LightColorConstants.secondaryColor_1
                            : DarkColorConstants.secondaryColor_1,
                    fontSize: isTabletPortrait(context) ? 24.sp : null,
                  ),
                ),
                //Todo: Implement the onTap function.
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

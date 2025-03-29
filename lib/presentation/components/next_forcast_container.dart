import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NextForcastCard extends StatelessWidget {
  const NextForcastCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.w),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.0.h),
          child: ListTile(
            visualDensity: VisualDensity.comfortable,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Friday',
                  style: textTheme.titleSmall,
                ),
                Text(
                  'May, 28',
                  style: textTheme.bodySmall,
                ),
              ],
            ),
            titleAlignment: ListTileTitleAlignment.center,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '30',
                  style: textTheme.displayMedium,
                ),
                Text(
                  'oC',
                  style: textTheme.titleSmall,
                )
              ],
            ),
            trailing: Lottie.asset(
              AssetPath.animatedSnowy,
              width: 20.w,
              height: 50.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

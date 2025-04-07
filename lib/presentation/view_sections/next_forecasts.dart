import 'package:bloc_app/presentation/components/next_forecast_container.dart';
import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextForecasts extends StatelessWidget {
  const NextForecasts({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: isTabletPortrait(context) ? .583.sh : .54.sh,
        maxWidth: double.infinity,
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          NextForecastCard(),
          sizedH4,
          NextForecastCard(),
          sizedH4,
          NextForecastCard(),
          sizedH4,
          NextForecastCard(),
          sizedH4,
          NextForecastCard(),
          sizedH4,
          NextForecastCard(),
          sizedH4,
          NextForecastCard(),
          sizedH4,
          NextForecastCard(),
          sizedH4,
          NextForecastCard(),
        ],
      ),
    );
  }
}

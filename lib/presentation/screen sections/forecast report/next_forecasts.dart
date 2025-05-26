import 'package:bloc_app/presentation/components/next_forecast_container.dart';
import 'package:bloc_app/utilities/orientation_helper_funtions.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';

class NextForecasts extends StatelessWidget {
  const NextForecasts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap:
          isPhoneLandscape(context) || isTabletLandscape(context)
              ? true
              : false,
      physics:
          isPhoneLandscape(context) || isTabletLandscape(context)
              ? NeverScrollableScrollPhysics()
              : BouncingScrollPhysics(),
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
    );
  }
}

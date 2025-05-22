import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc_app/presentation/components/air_quality_parameter_card_port.dart';
import 'package:bloc_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class AirQualityDetails extends StatelessWidget {
  const AirQualityDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedH8,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: _headerSection(context, textTheme),
              ),
              sizedH24,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: _airQualityIndexSection(context, textTheme),
              ),
              sizedH24,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Divider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: airQualityParameters(context, textTheme),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerSection(BuildContext context, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's Air Quality",
              style: textTheme.displaySmall?.copyWith(fontSize: 28.sp),
            ),
            Text(
              'San Francisco, USA',
              style: textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w100,
                fontSize: 16.sp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: OutlinedButton(
            onPressed: () {
              context.pushNamed('home');
            },
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              size: isTabletPortrait(context) ? 24.sp : 14.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _airQualityIndexSection(BuildContext context, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          radius: 50.r,
          center: Center(
            child: Text(
              '25%',
              style: textTheme.titleMedium?.copyWith(fontSize: 20.sp),
            ),
          ),
          animateToInitialPercent: true,
          animateFromLastPercent: true,
          animation: true,
          //arcBackgroundColor: Colors.grey,
          //arcType: ArcType.FULL,
          curve: Curves.easeInOut,
          lineWidth: 4.w,
          footer: Text(
            'AQI',
            style: textTheme.titleMedium?.copyWith(fontSize: 12.sp),
          ),
          onPercentValue: (value) {},
          rotateLinearGradient: true,
          progressColor: Colors.green,
          percent: .40,
          startAngle: 180,
        ),
        SizedBox(
          width: .65.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good',
                style: textTheme.titleMedium?.copyWith(fontSize: 24.sp),
              ),
              AutoSizeText(
                'Air quality is acceptable. However, for some pollutants there may be'
                        ' a moderate health concern for a very small number of people who are' +
                    ' unusually sensitive to air pollution.',
                maxLines: 5,
                wrapWords: true,
                textAlign: TextAlign.left,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget airQualityParameters(BuildContext context, TextTheme textTheme) {
    return Column(
      children: [
        Row(
          children: [
            AirQualityParameterCardPortrait(
              parameterName: ' (Particles < 2.5µm)',
              parameterSymbol: 'PM25',
              parameterValue: '17.59',
            ),
            AirQualityParameterCardPortrait(
              parameterName: ' (Nitrogen Dioxide)',
              parameterSymbol: 'NO₂',
              parameterValue: '18.89',
            ),
          ],
        ),
        Row(
          children: [
            AirQualityParameterCardPortrait(
              parameterName: ' (Ozone)',
              parameterSymbol: 'O₃',
              parameterValue: '79.49',
            ),
            AirQualityParameterCardPortrait(
              parameterName: ' (Sulphur Dioxide)',
              parameterSymbol: 'SO₂',
              parameterValue: '5.09',
            ),
          ],
        ),
        Row(
          children: [
            AirQualityParameterCardPortrait(
              parameterName: ' (Carbon Monoxide)',
              parameterSymbol: 'CO',
              parameterValue: '1360.59',
            ),
            AirQualityParameterCardPortrait(
              parameterName: ' (Particles < 10µm)',
              parameterSymbol: 'PM10',
              parameterValue: '34.24',
            ),
          ],
        ),
      ],
    );
  }
}

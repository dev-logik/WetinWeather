import 'package:bloc_app/presentation/components/gradient_spot.dart';
import 'package:bloc_app/presentation/components/hourly_report.dart';
import 'package:bloc_app/presentation/components/next_forcast_container.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';

class ForcastReportScreen extends StatefulWidget {
  const ForcastReportScreen({super.key});

  @override
  State<ForcastReportScreen> createState() => _ForcastReportScreenState();
}

class _ForcastReportScreenState extends State<ForcastReportScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -80.0,
            top: -80.0,
            child: GradientSpot(),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                sizedH32,
                //Page Header name
                Text(
                  'Forcast Report',
                  style: textTheme.headlineLarge,
                ),
                sizedH24,
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Today',
                        style: textTheme.headlineSmall,
                      ),
                      Text(
                        'May 27, 2025',
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                sizedH8,
                //Search input text form field.
                ConstrainedBox(
                  constraints:
                      BoxConstraints(maxHeight: 100, maxWidth: double.infinity),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      HourlyReportCard(),
                      HourlyReportCard(),
                      HourlyReportCard(),
                      HourlyReportCard(),
                      HourlyReportCard(),
                      HourlyReportCard(),
                    ],
                  ),
                ),
                sizedH8,
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Next Forcast',
                        style: textTheme.headlineSmall,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.calendar_month,
                        ),
                        padding: EdgeInsets.all(8.0),
                      ),
                    ],
                  ),
                ),
                sizedH8,
                NextForcastCard(),
                sizedH8,
                NextForcastCard(),
                sizedH8,
                NextForcastCard(),
                sizedH8,
                NextForcastCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

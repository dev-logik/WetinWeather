import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HourlyReportCard extends StatelessWidget {
  const HourlyReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 170),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Lottie.asset(
                AssetPath.animatedSnowy,
                width: 80,
                height: 80,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('15:00'),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '30',
                      style: textTheme.titleMedium,
                      children: <InlineSpan>[
                        TextSpan(text: ' C', style: textTheme.titleSmall)
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

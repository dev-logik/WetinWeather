import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NextForcastCard extends StatelessWidget {
  const NextForcastCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              width: 60,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class ForcastSummary extends StatelessWidget {
  const ForcastSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ConstrainedBox(
      key: const ValueKey(0),
      constraints: BoxConstraints(minHeight: 400, minWidth: 350),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 8),
        color: Color.fromRGBO(225, 225, 225, 225),
        child: Column(
          children: <Widget>[
            Lottie.asset(AssetPath.animatedCloudy,
                height: 300, width: 300, fit: BoxFit.cover),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Todo: Check if an icon can replace this.
                    //Todo: the values will be passed dynamically.
                    FaIcon(FontAwesomeIcons.thermometer),
                    Text(
                      '100 C',
                      style: textTheme.titleMedium,
                    ),
                    Text('Temperature'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Todo: Check if an icon can replace this.
                    //Todo: the values will be passed dynamically.
                    FaIcon(FontAwesomeIcons.wind),
                    Text(
                      '100 Km/hr',
                      style: textTheme.titleMedium,
                    ),
                    Text('Wind'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Todo: Check if an icon can replace this.
                    //Todo: the values will be passed dynamically.
                    FaIcon(FontAwesomeIcons.water),

                    Text(
                      '70%',
                      style: textTheme.titleMedium,
                    ),
                    Text('Humidity'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

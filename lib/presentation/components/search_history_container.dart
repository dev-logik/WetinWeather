import 'package:bloc_app/utilities/assets_path_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchHistoryCard extends StatelessWidget {
  const SearchHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 200,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '30',
                      style: textTheme.titleMedium,
                      children: <InlineSpan>[
                        TextSpan(text: ' C', style: textTheme.titleSmall)
                      ],
                    ),
                  ),
                  //Weather condition
                  Text(
                    'Cloudy',
                    style: textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //Displays the city
                  Align(
                    child: Text(
                      'New York',
                      style: textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
              Lottie.asset(
                AssetPath.animatedSnowy,
                width: 80,
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

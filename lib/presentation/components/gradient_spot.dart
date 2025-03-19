import 'dart:ui';

import 'package:bloc_app/utilities/color_constants.dart';
import 'package:flutter/material.dart';

class GradientSpot extends StatelessWidget {
  const GradientSpot({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
          tileMode: TileMode.decal,
        ),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                DarkColorConstants.gradientColor1,
                DarkColorConstants.gradientColor_2,
              ],
              transform: GradientRotation(4 * 3.142),
            ),
          ),
        ),
      ),
    );
  }
}

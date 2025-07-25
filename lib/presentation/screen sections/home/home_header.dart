import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../bloc/cubits_blocs.dart';
import '../../../services/services.dart';
import '../../../utilities/utilities.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late final LocationCubit locationStateProvider;
  late final DateTimeCubit dateTimeCubitProvider;

  @override
  void initState() {
    super.initState();
    dateTimeCubitProvider = context.read<DateTimeCubit>();
    locationStateProvider = context.read<LocationCubit>();
    dateTimeCubitProvider.startTime();
    locationStateProvider.startLocationService(
      locationStyleOption: LocationDisplayStyleOptions.CITY,
    );
  }

  @override
  void dispose() {
    dateTimeCubitProvider.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isLightThemed = Theme.of(context).brightness == Brightness.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state.locationName != null) {
              return Text(
                '${(state.locationName)}',
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: isTabletPortrait(context) ? 70.sp : null,
                ),
              );
            }

            return Skeletonizer(
              enabled: state.locationName == null,
              enableSwitchAnimation: true,
              switchAnimationConfig: SwitchAnimationConfig(
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
              ),
              effect: ShimmerEffect(
                baseColor:
                    (isLightThemed)
                        ? LightColorConstants.primaryColor
                        : DarkColorConstants.primaryColor,
                highlightColor:
                    (isLightThemed)
                        ? LightColorConstants.secondaryColor_2
                        : DarkColorConstants.secondaryColor_2,
                duration: Duration(milliseconds: 700),
              ),
              child: Text(
                'Loading...',
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: isTabletPortrait(context) ? 70.sp : null,
                ),
              ),
            );
          },
        ),
        sizedH8,
        BlocBuilder<DateTimeCubit, DateTimeState>(
          builder: (context, state) {
            return Text(
              '${formatDate(state.accessDateTime)}',
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w100,
                fontSize: isTabletPortrait(context) ? 25.sp : null,
              ),
            );
          },
        ),
      ],
    );
  }
}

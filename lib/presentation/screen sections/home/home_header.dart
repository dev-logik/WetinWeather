import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/cubits.dart';
import '../../../utilities/utilities.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late final locationStateProvider, dateTimeCubitProvider;
  @override
  void initState() {
    super.initState();
    dateTimeCubitProvider = context.read<DateTimeCubit>();
    locationStateProvider = context.read<LocationCubit>();
    dateTimeCubitProvider.startTime();
    if (locationStateProvider.state.locationName == '') {
      locationStateProvider.startLocationService();
    }
  }

  @override
  void dispose() {
    dateTimeCubitProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isLightThemed = Theme.of(context).brightness == Brightness.light;
    return Column(
      children: [
        BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state.locationName.isNotEmpty) {
              return Text(
                '${(state.locationName)}',
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: isTabletPortrait(context) ? 70.sp : null,
                ),
              );
            } else {
              return CircularProgressIndicator(
                backgroundColor: Colors.white,
                color:
                    (isLightThemed)
                        ? LightColorConstants.secondaryColor_1
                        : DarkColorConstants.secondaryColor_1,
              );
            }
          },
        ),
        sizedH8,
        BlocBuilder<DateTimeCubit, DateTimeState>(
          builder: (_, state) {
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

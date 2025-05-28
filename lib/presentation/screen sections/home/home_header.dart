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
  @override
  void initState() {
    super.initState();
    context.read<DateTimeCubit>().startTime();
  }

  @override
  void dispose() {
    context.read<DateTimeCubit>().dispose();
    context.read<LocationCubit>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            return Text(
              '${state.locationName}',
              style: textTheme.headlineLarge?.copyWith(
                fontSize: isTabletPortrait(context) ? 70.sp : null,
              ),
            );
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

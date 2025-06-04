import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../bloc/cubits.dart';
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
    dateTimeCubitProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    //final isLightThemed = Theme.of(context).brightness == Brightness.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StreamBuilder<LocationState>(
          stream: locationStateProvider.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              Fluttertoast.showToast(
                msg: snapshot.error.toString(),
                backgroundColor: Colors.redAccent,
                textColor: Colors.white,
                gravity: ToastGravity.SNACKBAR,
                fontSize: 14.sp,
              );
            }

            if (snapshot.hasData) {
              return Text(
                '${(snapshot.data?.locationName)}',
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: isTabletPortrait(context) ? 70.sp : null,
                ),
              );
            }

            return Skeletonizer(
              enabled: true,
              effect: ShimmerEffect(),
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

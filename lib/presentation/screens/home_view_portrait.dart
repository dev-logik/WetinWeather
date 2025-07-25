import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../bloc/cubits_blocs.dart';
import '../../services/services.dart';
import '../../utilities/utilities.dart';
import '../components/components.dart';
import '../screen sections/screen_sections.dart';

class HomeScreenMobilePortrait extends StatefulWidget {
  const HomeScreenMobilePortrait({super.key});

  @override
  State<HomeScreenMobilePortrait> createState() =>
      _HomeScreenMobilePortraitState();
}

class _HomeScreenMobilePortraitState extends State<HomeScreenMobilePortrait> {
  late final AirQualityBloc _airQualityBloc;
  late final WeatherDataBloc _weatherDataBloc;
  late final HourlyWeatherForecastDataBloc _forecastDataBloc;
  late final LocationCubit locationStateProvider;
  late final DateTimeCubit dateTimeCubitProvider;

  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    dateTimeCubitProvider = context.read<DateTimeCubit>();
    locationStateProvider = context.read<LocationCubit>();
    _airQualityBloc = context.read();
    _weatherDataBloc = context.read();
    _forecastDataBloc = context.read();
    locationStateProvider.startLocationService(
      locationStyleOption: LocationDisplayStyleOptions.CITY,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _airQualityBloc.close();
    _weatherDataBloc.close();
    _forecastDataBloc.close();
    dateTimeCubitProvider.close();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _handlePullToRefresh() async {
      if (_isRefreshing) return;
      await context.read<LocationCubit>().startLocationService();
      _airQualityBloc.add(PullToRefreshEvent());
      _weatherDataBloc.add(PullToRefreshWeatherEvent());
      _isRefreshing = true;
    }

    final isLightThemed = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned(right: -80.0, top: -80.0, child: GradientSpot()),
              Positioned(
                left: 0,
                right: 0,
                child: LiquidPullToRefresh(
                  backgroundColor:
                      (isLightThemed)
                          ? LightColorConstants.primaryColor
                          : DarkColorConstants.primaryColor,
                  color:
                      (isLightThemed)
                          ? DarkColorConstants.secondaryColor_2
                          : LightColorConstants.secondaryColor_2,
                  onRefresh: _handlePullToRefresh,
                  child: SizedBox(
                    width: 1.sw,
                    height: .9.sh,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        sizedH16,
                        //Todo: Pass Dynamic Location name.
                        HomeHeader(),
                        sizedH8,
                        //Todo: Define a bloc for handling these events
                        HomeSummary(),
                        sizedH8,
                        HourlyHeader(),
                        //Todo: Replace with a list view builder to display
                        //Todo: the hourly reports dynamically.
                        HourlySection(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

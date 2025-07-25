import 'package:bloc_app/data/repositories/hourly_forecast_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../data/database/hive_local_storage.dart';
import '../../models/models.dart';

class FutureTesting extends StatefulWidget {
  const FutureTesting({super.key});

  @override
  State<FutureTesting> createState() => _FutureTestingState();
}

class _FutureTestingState extends State<FutureTesting> {
  @override
  void initState() {
    super.initState();
  }

  Future<HiveLocalStorage<HourlyWeatherForecastModel>> _initBox() async {
    late HiveLocalStorage<HourlyWeatherForecastModel> currentWeatherBox;

    currentWeatherBox =
        await HiveLocalStorage.create<HourlyWeatherForecastModel>(
          boxName: 'forecast_box',
          dataKey: 'forecast_key',
        );
    return currentWeatherBox;
  }

  Future<Result> fetchData() async {
    return HourlyWeatherForecastRepository(
      currentWeatherStorage: await _initBox(),
    ).fetchDataWithBackup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          debugPrint('DATABODY: ' + snapshot.data.toString());
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return Center(
                child: SingleChildScrollView(
                  child: Text((snapshot.data as Success).value.toString()),
                ),
              );
            }
          }

          if (snapshot.hasError) {
            debugPrint('ERROR: ' + (snapshot.error.toString()));
            Fluttertoast.showToast(
              msg: snapshot.error.toString(),
              toastLength: Toast.LENGTH_LONG,
            );
          }
          return Center(child: Text('Error Fetching Data!'));
        },
      ),
    );
  }
}

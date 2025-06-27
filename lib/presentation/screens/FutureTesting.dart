import 'package:bloc_app/data/repositories/repositories.dart';
import 'package:bloc_app/services/response_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FutureTesting extends StatefulWidget {
  const FutureTesting({super.key});
  @override
  State<FutureTesting> createState() => _FutureTestingState();
}

class _FutureTestingState extends State<FutureTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: WeatherRepository().fetchDataWithBackup(),
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
            debugPrint('ERROR: ' + (snapshot.error as Error).toString());
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

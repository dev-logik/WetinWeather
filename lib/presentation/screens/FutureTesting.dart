import 'package:bloc_app/data/repositories/air_quality_repository.dart';
import 'package:flutter/material.dart';

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
        future: AirQualityRepository().filteredData(),
        builder: (context, snapshot) {
          debugPrint(snapshot.data.toString());

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return Center(
                child: SingleChildScrollView(child: Text(snapshot.toString())),
              );
            }
          }
          return Center(child: Text('Error Fetching Data!'));
        },
      ),
    );
  }
}

import 'package:bloc_app/presentation/components/gradient_spot.dart';
import 'package:bloc_app/presentation/components/search_history_container.dart';
import 'package:bloc_app/presentation/screen sections/search_field.dart';
import 'package:bloc_app/presentation/screen sections/search_header.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -80.0,
              top: -80.0,
              child: GradientSpot(),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  sizedH16,
                  SearchHeader(),
                  sizedH8,
                  //Search input text form field.
                  SearchField(),
                  //sizedH8,
                  //Todo: Place a gridbuilder that will generate a list of container.
                  SearchHistoryCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

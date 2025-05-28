import 'package:bloc_app/presentation/components/components.dart';
import 'package:bloc_app/utilities/orientation_helpers.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';

import '../screen sections/screen_sections.dart';

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
            Positioned(right: -80.0, top: -80.0, child: GradientSpot()),
            Positioned(
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  isPhoneLandscape(context) ? sizedH4 : sizedH16,
                  SearchHeader(),
                  sizedH8,
                  //Search input text form field.
                  SearchField(),
                  sizedH8,
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

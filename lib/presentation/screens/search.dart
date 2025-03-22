import 'package:bloc_app/presentation/components/gradient_spot.dart';
import 'package:bloc_app/presentation/components/search_history_container.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
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
                sizedH32,
                //Page Header name
                Text(
                  'Pick Location',
                  style: textTheme.headlineLarge,
                ),
                sizedH16,
                Text(
                  'Find the area or city that you want to know the detailed weather info at this time.',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w100,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                sizedH32,
                //Search input text form field.
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextField(
                          controller: textEditingController,
                          enabled: true,
                          showCursor: true,
                          scrollPhysics:
                              ScrollPhysics(parent: BouncingScrollPhysics()),
                        ),
                      ),
                    ),
                    Card(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on_outlined,
                        ),
                        padding: EdgeInsets.all(8.0),
                      ),
                    )
                  ],
                ),
                sizedH32,
                //Todo: Place a gridbuilder that will generate a list of container.
                SearchHistoryCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:bloc_app/presentation/components/gradient_spot.dart';
import 'package:bloc_app/presentation/components/search_history_container.dart';
import 'package:bloc_app/utilities/helper_funtions.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final brightness = Theme.of(context).brightness;

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
                sizedH16,
                //Page Header name
                Text(
                  'Pick Location',
                  style: textTheme.headlineLarge,
                ),
                sizedH8,
                Text(
                  'Find the area or city that you want to know the detailed weather info at this time.',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w100,
                    fontSize: setValuesBasedOnOrientation(
                      ifTrue: 8.0.sp,
                      ifFalse: 15.0.sp,
                      context: context,
                    ),
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                sizedH8,
                //Search input text form field.
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                        child: TextField(
                          controller: textEditingController,
                          enabled: true,
                          showCursor: true,
                          scrollPhysics:
                              ScrollPhysics(parent: BouncingScrollPhysics()),
                          keyboardAppearance: (brightness == Brightness.light)
                              ? Brightness.light
                              : Brightness.dark,
                          enableSuggestions: true,
                        ),
                      ),
                    ),
                    Card(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on_outlined,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.w),
                      ),
                    )
                  ],
                ),
                //sizedH8,
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

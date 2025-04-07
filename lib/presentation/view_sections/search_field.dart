import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
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
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0.w),
            child: TextField(
              controller: textEditingController,
              enabled: true,
              showCursor: true,
              scrollPhysics: ScrollPhysics(parent: BouncingScrollPhysics()),
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
              horizontal: 4.w,
              vertical: 4.h,
            ),
          ),
        )
      ],
    );
  }
}

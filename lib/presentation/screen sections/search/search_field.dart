import 'package:bloc_app/utilities/helper_funtions.dart';
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
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isLightThemed = Theme.of(context).brightness == Brightness.light;
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isTabletPortrait(context) ? 10.w : 5.0.w,
            ),
            child: TextField(
              cursorHeight: 30.sp,
              cursorColor: Colors.white,
              cursorWidth: 2.sp,
              style: textTheme.bodyMedium?.copyWith(
                fontSize:
                    isTabletPortrait(context)
                        ? 24.sp
                        : isTabletLandscape(context)
                        ? 30.sp
                        : null,
              ),
              controller: textEditingController,
              enabled: true,
              showCursor: true,
              scrollPhysics: ScrollPhysics(parent: BouncingScrollPhysics()),
              keyboardAppearance:
                  (isLightThemed) ? Brightness.light : Brightness.dark,
              enableSuggestions: true,
            ),
          ),
        ),
        Card(
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.location_on_outlined,
              size:
                  isTabletPortrait(context)
                      ? 30.sp
                      : isTabletLandscape(context)
                      ? 40.sp
                      : null,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isTabletLandscape(context) ? 12.w : 4.w,
              vertical: isTabletLandscape(context) ? 12.h : 4.h,
            ),
          ),
        ),
      ],
    );
  }
}

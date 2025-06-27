import 'package:bloc_app/bloc/theme_cubit.dart';
import 'package:bloc_app/presentation/components/gradient_spot.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utilities/utilities.dart';

enum UnitSystemEnum { British, Metric }

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isThemeModeLight = Theme.of(context).brightness == Brightness.light;
    final themeProvider = context.read<ThemeModeCubit>();
    final unitSystemDropdownItems = [
      DropdownMenuItem<UnitSystemEnum>(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [FaIcon(FontAwesomeIcons.earthEurope), Text('British')],
        ),
        value: UnitSystemEnum.British,
      ),
      DropdownMenuItem<UnitSystemEnum>(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [FaIcon(FontAwesomeIcons.earthAmericas), Text('Metric')],
        ),
        value: UnitSystemEnum.Metric,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(right: -80.0, top: -80.0, child: GradientSpot()),
            Positioned(
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  sizedH16,
                  //Page Header name
                  Text('App Settings', style: textTheme.headlineLarge),
                  sizedH24,
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: double.infinity,
                      maxHeight: setLandscapeValues(
                        ifTrue: isTabletLandscape(context) ? .65.sh : .51.sh,
                        ifFalse: 0.85.sh,
                        context: context,
                      ),
                    ),
                    child: ListView(
                      children: [
                        Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 8.w,
                            ),
                            child: ListTile(
                              visualDensity: VisualDensity.comfortable,
                              leading: FaIcon(
                                FontAwesomeIcons.bell,
                                color: DarkColorConstants.tertiaryColor,
                                size: 24,
                              ),
                              title: Text(
                                'Notification',
                                style: textTheme.titleMedium,
                              ),
                              trailing: Switch(
                                value: false,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                        ),
                        sizedH16,
                        Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 8.w,
                            ),
                            child: SwitchListTile(
                              visualDensity: VisualDensity.comfortable,
                              secondary:
                                  (isThemeModeLight)
                                      ? FaIcon(
                                        FontAwesomeIcons.sun,
                                        color: DarkColorConstants.tertiaryColor,
                                        size: 24,
                                      )
                                      : FaIcon(
                                        FontAwesomeIcons.moon,
                                        color: DarkColorConstants.tertiaryColor,
                                        size: 24,
                                      ),
                              title: Text(
                                'Toggle Theme',
                                style: textTheme.titleMedium,
                              ),
                              value: themeProvider.state.isDarkThemed,
                              onChanged: (value) {
                                themeProvider.toggleThemeMode(!value);
                              },
                              dragStartBehavior: DragStartBehavior.start,
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 8.w,
                            ),
                            child: ListTile(
                              visualDensity: VisualDensity.comfortable,
                              leading: FaIcon(
                                FontAwesomeIcons.ruler,
                                color: DarkColorConstants.tertiaryColor,
                                size: 24,
                              ),
                              title: Text(
                                'Unit System',
                                style: textTheme.titleMedium,
                              ),
                              trailing: DropdownButton<UnitSystemEnum>(
                                items: unitSystemDropdownItems,
                                dropdownColor:
                                    isThemeModeLight
                                        ? LightColorConstants.secondaryColor_1
                                        : DarkColorConstants.secondaryColor_2,
                                onChanged: (value) {},
                                isDense: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

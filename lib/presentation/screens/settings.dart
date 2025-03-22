import 'package:bloc_app/bloc/theme_mode_cubit.dart';
import 'package:bloc_app/presentation/components/gradient_spot.dart';
import 'package:bloc_app/utilities/color_constants.dart';
import 'package:bloc_app/utilities/sizedbox_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isThemeModeLight = Theme.of(context).brightness;
    final themeModeWatchBloc = context.watch<ThemeModeCubit>();
    final themeModeReadBloc = context.read<ThemeModeCubit>();
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
                  'App Settings',
                  style: textTheme.headlineLarge,
                ),
                sizedH24,
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      visualDensity: VisualDensity.comfortable,
                      leading: FaIcon(
                        FontAwesomeIcons.bell,
                        color: DarkColorConstants.tertiaryColor,
                        size: 24,
                      ),
                      title: Text(
                        'Notification',
                        style: textTheme.titleSmall,
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
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      visualDensity: VisualDensity.comfortable,
                      leading: (isThemeModeLight == Brightness.light)
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
                        'Dark Theme',
                        style: textTheme.titleSmall,
                      ),
                      trailing: Switch(
                        value: themeModeWatchBloc.isLightFlag,
                        onChanged: (value) {
                          themeModeReadBloc.toggleThemeMode(value);
                          themeModeReadBloc.isLightFlag = value;
                          print(themeModeWatchBloc.isLightFlag);
                        },
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      visualDensity: VisualDensity.comfortable,
                      leading: FaIcon(
                        FontAwesomeIcons.temperatureFull,
                        color: DarkColorConstants.tertiaryColor,
                        size: 24,
                      ),
                      title: Text(
                        'Temperature',
                        style: textTheme.titleSmall,
                      ),
                      trailing: DropdownButton<String>(
                        items: [],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      visualDensity: VisualDensity.comfortable,
                      leading: FaIcon(
                        FontAwesomeIcons.cloudRain,
                        color: DarkColorConstants.tertiaryColor,
                        size: 24,
                      ),
                      title: Text(
                        'Precipitation',
                        style: textTheme.titleSmall,
                      ),
                      trailing: DropdownButton<String>(
                        items: [],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      visualDensity: VisualDensity.comfortable,
                      leading: FaIcon(
                        FontAwesomeIcons.wind,
                        color: DarkColorConstants.tertiaryColor,
                        size: 24,
                      ),
                      title: Text(
                        'Wind Speed',
                        style: textTheme.titleSmall,
                      ),
                      trailing: DropdownButton<String>(
                        items: [],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      visualDensity: VisualDensity.comfortable,
                      leading: FaIcon(
                        FontAwesomeIcons.warehouse,
                        color: DarkColorConstants.tertiaryColor,
                        size: 24,
                      ),
                      title: Text(
                        'Pressure',
                        style: textTheme.titleSmall,
                      ),
                      trailing: DropdownButton<String>(
                        items: [],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

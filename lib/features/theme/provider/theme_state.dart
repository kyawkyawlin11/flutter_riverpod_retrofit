import 'package:flutter/material.dart';

sealed class WeatherThemeState {
  ThemeData getTheme();
}

class LightWeatherTheme extends WeatherThemeState {
  @override
  ThemeData getTheme() {
    return ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.indigo),
        navigationRailTheme: const NavigationRailThemeData(
          unselectedLabelTextStyle: TextStyle(color: Colors.indigo),
          selectedLabelTextStyle: TextStyle(color: Colors.indigo, fontSize: 16),
          selectedIconTheme: IconThemeData(color: Colors.indigo, size: 30),
          unselectedIconTheme: IconThemeData(color: Colors.indigo),
        ));
  }
}

class DarkWeatherTheme extends WeatherThemeState {
  @override
  ThemeData getTheme() {
    return ThemeData.dark().copyWith(
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith((value) {
        return Colors.white;
      }), trackColor: MaterialStateProperty.resolveWith((states) {
        return Colors.grey;
      })),
      navigationRailTheme: const NavigationRailThemeData(
          unselectedLabelTextStyle: TextStyle(color: Colors.grey),
          selectedLabelTextStyle: TextStyle(color: Colors.white, fontSize: 16),
          selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
        )
    );
  }
}

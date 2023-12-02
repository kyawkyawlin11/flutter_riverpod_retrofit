import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/theme/provider/theme_state.dart';

class ThemeNotifier extends Notifier<WeatherThemeState>{
  final WeatherThemeState _weatherTheme = LightWeatherTheme();
  @override
  build() {
    return _weatherTheme;
  }

  void changeTheme(WeatherThemeState weatherTheme){
    state = weatherTheme;
  }

}

NotifierProvider<ThemeNotifier,WeatherThemeState> themeProvider = NotifierProvider((){
  return ThemeNotifier();
});

import 'package:weather_app/features/current_weather/data/model/current_weather.dart';

sealed class CurrentWeatherState{}

class CurrentWeatherLoading extends CurrentWeatherState{}
class CurrentWeatherSuccess extends CurrentWeatherState{
  final CurrentWeatherModel currentWeatherModel;
  CurrentWeatherSuccess(this.currentWeatherModel);
}
class CurrentWeatherFail extends CurrentWeatherState{
  final String errorMessage;
  CurrentWeatherFail(this.errorMessage);
}
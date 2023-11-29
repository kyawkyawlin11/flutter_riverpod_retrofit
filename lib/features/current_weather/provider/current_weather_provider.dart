import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/current_weather/data/model/current_weather.dart';
import 'package:weather_app/features/current_weather/data/service/current_weather_service.dart';
import 'package:weather_app/features/current_weather/provider/current_weather_state.dart';
import 'package:weather_app/provider/dio/dio_provider.dart';
import 'package:dio/dio.dart';

class CurrentWeatherProvider extends Notifier<CurrentWeatherState>{
  final CurrentWeatherState _currentWeatherState = CurrentWeatherLoading();
  @override
  CurrentWeatherState build() {
    return _currentWeatherState;
  }
  
  void getWeather({required String latitude, required String longitude}) async{
    Dio dio= ref.read(dioProvider);

    try{
      state = CurrentWeatherLoading();
      CurrentWeatherApiService _currentWeatherApiService = CurrentWeatherApiService(dio);
      CurrentWeatherModel currentWeatherModel = await _currentWeatherApiService.getCurrentWeather(latitude: latitude, longitude: longitude, currentWeather: true);
      state = CurrentWeatherSuccess(currentWeatherModel);
    }catch(e){
      state = CurrentWeatherFail(e.toString());
    }
  }
}

final currentWeatherProvider = NotifierProvider<CurrentWeatherProvider,CurrentWeatherState> (()=>CurrentWeatherProvider());
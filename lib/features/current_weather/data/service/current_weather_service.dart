
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/features/current_weather/data/model/current_weather.dart';
import 'package:weather_app/helper/constant/constant.dart';
import 'package:dio/dio.dart';
part 'current_weather_service.g.dart';

@RestApi(baseUrl: ApiConst.weatherBaseUrl)
abstract class CurrentWeatherApiService{
  
  factory CurrentWeatherApiService(Dio dio) => _CurrentWeatherApiService(dio);
  @GET(ApiConst.currentWatherEndPoint)
  Future<CurrentWeatherModel> getCurrentWeather(
    {
      @Query('latitude') required String latitude,
      @Query('longitude') required String longitude,
      @Query('current_weather') required bool currentWeather,
    }
  );
}
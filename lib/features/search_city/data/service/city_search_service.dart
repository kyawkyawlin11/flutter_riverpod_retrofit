
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/helper/constant/constant.dart';
import 'package:weather_app/features/search_city/data/model/city_search_model.dart';
import 'package:dio/dio.dart';

part 'city_search_service.g.dart';

@RestApi(baseUrl: ApiConst.citySearchBaseUrl)
abstract class CitySearchApiService{

  factory CitySearchApiService(Dio dio)=> _CityApiService(dio);
  
  @GET(ApiConst.citySearchEndPoint)
  Future<CitySearchResult> searchCity({
    @Query('name') required String name, 
    @Query('count') required int count,
    @Query('language') required String language,
    @Query('format') required String format,
    });
}
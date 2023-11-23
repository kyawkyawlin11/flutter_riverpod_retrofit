import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/provider/dio/dio_provider.dart';
import 'package:weather_app/features/search_city/data/model/city_search_result.dart';
import 'package:weather_app/features/search_city/data/service/city_search_service.dart';
import 'package:weather_app/features/search_city/provider/city_search_state.dart';
import 'package:dio/dio.dart';

class CitySearchProvider extends Notifier{
  CitySearchState citySearchState=CitySearchLoading();
  @override
  build() {
    return citySearchState;
  }

  late final Dio dio=ref.read(dioProvider);
  late final CityApiService _cityServiceApi = CityApiService(dio);
  void searchCity(String name) async{
    citySearchState = CitySearchLoading();
    CitySearchResult citySearchResult= await _cityServiceApi.searchCity(name: name, count: 10, language: 'en', format: 'json');

  }
}
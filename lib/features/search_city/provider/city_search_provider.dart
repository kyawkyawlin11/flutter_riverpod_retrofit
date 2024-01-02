import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/provider/dio/dio_provider.dart';
import 'package:weather_app/features/search_city/data/model/city_search_model.dart';
import 'package:weather_app/features/search_city/data/service/city_search_service.dart';
import 'package:weather_app/features/search_city/provider/city_search_state.dart';
import 'package:dio/dio.dart';

class CitySearchProvider extends Notifier<CitySearchState> {
  final CitySearchState _citySearchState = CitySearchInitial();
  @override
  build() {
    return _citySearchState;
  }

  late final Dio dio = ref.read(dioProvider);
  late final CitySearchApiService _cityServiceApi = CitySearchApiService(dio);
  void searchCity(String name) async {
    state = CitySearchLoading();

    try {
      CitySearchResult citySearchResult = await _cityServiceApi.searchCity(name: name, count: 15, language: 'en', format: 'json');
      state = CitySearchSuccess(citySearchResult);
    } catch (e) {
      state = CitySearchFail(e.toString());
    }
  }
}

NotifierProvider<CitySearchProvider,CitySearchState> citySearchProvider = NotifierProvider(()=> CitySearchProvider());

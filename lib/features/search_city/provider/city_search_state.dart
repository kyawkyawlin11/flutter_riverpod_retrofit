import 'package:weather_app/features/search_city/data/model/city_search_model.dart';

sealed class CitySearchState{}

class CitySearchInitial extends CitySearchState{}
class CitySearchLoading extends CitySearchState{}
class CitySearchSuccess extends CitySearchState{
  final CitySearchResult citySearchResult;
  CitySearchSuccess(this.citySearchResult);
}
class CitySearchFail extends CitySearchState{
  final String errMessage;
  CitySearchFail(this.errMessage);
}
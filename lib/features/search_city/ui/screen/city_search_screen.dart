import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/search_city/data/model/city_search_model.dart';
import 'package:weather_app/features/search_city/provider/city_search_provider.dart';
import 'package:weather_app/features/search_city/provider/city_search_state.dart';
import 'package:weather_app/features/search_city/ui/widget/citylist_widget.dart';
import 'package:weather_app/features/theme/provider/theme_provider.dart';
import 'package:weather_app/features/theme/provider/theme_state.dart';

class CitySearchScreen extends ConsumerStatefulWidget {
  const CitySearchScreen({super.key});

  @override
  ConsumerState<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends ConsumerState<CitySearchScreen> {
  TextEditingController _citySearchTextController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    CitySearchState citySearchState = ref.watch(citySearchProvider);
    final mProvider =  ref.watch(citySearchProvider.notifier);
    final weatherTheme = ref.watch(themeProvider);
    final weatherNotifier = ref.read(themeProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text('Rivverpod Weather'), centerTitle: true,
      actions: [
        Switch(value: (weatherTheme is DarkWeatherTheme) , 
        onChanged: (value){
          if(value){
            weatherNotifier.changeTheme(DarkWeatherTheme());
          }else{
            weatherNotifier.changeTheme(LightWeatherTheme());
          }
        })
      ],),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              controller: _citySearchTextController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: const Text('Search City'),
                suffixIcon: IconButton(
                onPressed: (){
                  String city = _citySearchTextController.text.trim();
                  if(city.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please Enter Completely')));
                  }else{
                    mProvider.searchCity(city);
                  }
                }, 
                icon: const Icon(Icons.search)),
              
              ),
              onSubmitted: (str) {
                if(str.isNotEmpty){
                  mProvider.searchCity(str);
                }
              },
            ),
          ),
          Expanded(child: _citySearchResultWidget(citySearchState)),
        ],
      ),
    );
  }

  Widget _citySearchResultWidget(CitySearchState citySearchState){
    return Center(
      child: switch(citySearchState){
        CitySearchInitial() => const Text('Please search city'),
        CitySearchLoading() => const CircularProgressIndicator(),
        CitySearchSuccess(citySearchResult: CitySearchResult citySearchResult) => CityListWidget(citySearchResult),
        CitySearchFail(errMessage: String message) =>  Text(message)
      },
    );
  }
}
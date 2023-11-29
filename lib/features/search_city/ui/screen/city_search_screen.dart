import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/search_city/data/model/city_search_model.dart';
import 'package:weather_app/features/search_city/provider/city_search_provider.dart';
import 'package:weather_app/features/search_city/provider/city_search_state.dart';
import 'package:weather_app/features/search_city/ui/widget/citylist_widget.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
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
                icon: const Icon(Icons.search))
              ),
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
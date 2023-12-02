import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/search_city/data/model/city_search_model.dart';
import 'package:weather_app/features/search_city/ui/widget/flag_widget.dart';

class CityListWidget extends StatelessWidget {
  const CityListWidget(this.citySearchResult, {super.key});

  final CitySearchResult citySearchResult;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: citySearchResult.results?.length ?? 0,
      itemBuilder: (context, index) {
        Results results = citySearchResult.results![index];
        return InkWell(
          onTap: (){
            if(kIsWeb){
              // for web path parameter
              context.go('/current/${results.latitude}/${results.longitude}/${results.name}');
            }else{
              context.go('/current/${results.latitude}/${results.longitude}/${results.name}');
            //   context.push('/current',
            // extra: {
            //   'lati':results.latitude.toString(),
            // 'longi':results.longitude.toString(),
            // 'city':results.name
            // }
            // );
            }
            
          },
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        results.name ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(results.country ?? ''),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(results.admin1 ?? ''),
                    ),
                  ],
                ),
                FlagWidget(results: results)
              ],
            ),
          ),
        );
      },
    );
  }
}

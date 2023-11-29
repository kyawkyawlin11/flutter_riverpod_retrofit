import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:weather_app/features/search_city/data/model/city_search_model.dart';

class FlagWidget extends StatelessWidget {
  const FlagWidget({
    super.key,
    required this.results,
  });

  final Results results;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
          imageUrl: 'https://flagsapi.com/${results.countryCode}/shiny/64.png',
          width: 64,
          height: 64,
          progressIndicatorBuilder: (_,__,___){return const Center(child: CircularProgressIndicator(),);},
          errorWidget: (context, url, error) {
            return const Center(child: Icon(Icons.error,color: Colors.red,),);
          },
          );
  }
}


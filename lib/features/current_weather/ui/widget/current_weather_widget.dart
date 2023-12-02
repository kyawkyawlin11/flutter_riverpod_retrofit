
import 'package:flutter/material.dart';
import 'package:weather_app/features/current_weather/data/model/current_weather.dart';
import 'package:weather_app/features/current_weather/ui/screen/current_weather_screen.dart';
import 'package:weather_app/helper/utils/weather_code.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
    super.key,
    required this.widget,
    required this.current,
  });

  final CurrentWeatherScreen widget;
  final CurrentWeatherModel current;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
        Color(0xff5C6BC0),
        Color(0xff3949AB),
        Color(0xff283593),
      ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.city,
          style: const TextStyle(
            fontSize: 34,
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),),
          const SizedBox(height: 50),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: Center(
                child: 
                Text('${current.currentWeather?.weathercode?.toCondition().toEmoji()}',
                style: const TextStyle(
                    fontSize: 74,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  )
                  
              )
              )
              ),
              // ignore: unnecessary_string_interpolations
              Expanded(
                child: Center(
                  child: Text('${current.currentWeather?.weathercode?.toCondition()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontWeight: FontWeight.w600
                  )
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text('${current.currentWeather?.temperature} C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontWeight: FontWeight.w600
                  )
                  ),
                ),
              )
            ],
           )
        ],
      ),
    );
  }
}

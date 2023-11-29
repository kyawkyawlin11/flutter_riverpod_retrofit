import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/current_weather/data/model/current_weather.dart';
import 'package:weather_app/features/current_weather/provider/current_weather_provider.dart';
import 'package:weather_app/features/current_weather/provider/current_weather_state.dart';
import 'package:weather_app/features/current_weather/ui/widget/current_weather_widget.dart';


class CurrentWeatherScreen extends ConsumerStatefulWidget {
  const CurrentWeatherScreen(
      {super.key, required this.latitude, required this.longitude, required this.city});
  final String latitude, longitude,city;

  @override
  ConsumerState<CurrentWeatherScreen> createState() =>
      _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends ConsumerState<CurrentWeatherScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _getWeather();
  }

  @override
  Widget build(BuildContext context) {
    final currentWeatherState = ref.watch(currentWeatherProvider);
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          
          _weatherWidget(currentWeatherState),
          SafeArea(
            child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
            icon: Icon(Icons.arrow_back)
            ),
          ),
        ],
      ),
    );
  }

  //add to event_loop or microtask_queue
  void _getWeather() async {
    // add to event_loop
    await Future.delayed(Duration.zero, () {
      ref
          .read(currentWeatherProvider.notifier)
          .getWeather(latitude: widget.latitude, longitude: widget.longitude);
    });
  }

  Widget _weatherWidget(CurrentWeatherState currentWeatherState) {
    return switch (currentWeatherState) {
      CurrentWeatherLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
      CurrentWeatherSuccess(currentWeatherModel: CurrentWeatherModel current) =>
        CurrentWeatherWidget(widget: widget, current: current),
      CurrentWeatherFail(errorMessage: String error) => Center(
          child: Text(error),
        ),
    };
  }
}

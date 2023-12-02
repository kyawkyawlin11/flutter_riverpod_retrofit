import 'package:go_router/go_router.dart';
import 'package:weather_app/features/current_weather/ui/screen/current_weather_screen.dart';
import 'package:weather_app/features/search_city/ui/screen/city_search_screen.dart';
import 'package:weather_app/features/setting/setting_screen.dart';

class RouteList{
 static final routeList=[
          StatefulShellBranch(routes: [
            GoRoute(
                path: '/',
                builder: (context, state) {
                  return const CitySearchScreen();
                }),
            GoRoute(
              //path:'/current',
              path: '/current/:lati/:longi/:city',// for web path parameter
              builder: (context, routeState) {
                // final query = routeState.extra as Map;
                return CurrentWeatherScreen(
                    latitude: routeState.pathParameters['lati']??'',
                    longitude: routeState.pathParameters['longi']??'',
                    city: routeState.pathParameters['city']??''

                    //  latitude: query['lati'],
                    // longitude: query['longi'],
                    // city: query['city']
                    );
                    
              },
            )
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/setting',
            builder: (context, state) {
              return const SettingScreen();
            },)
          ])
        ];
}
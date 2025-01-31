import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/core/utils/api_key.dart';
import 'package:weather_app/core/utils/shared.dart';
import 'package:weather_app/features/home%20view/data/bloc/weather_bloc/weather_event.dart';
import 'package:weather_app/features/home%20view/data/bloc/weather_bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  String cityName = Shared.getString(key: "city");
  late Weather updatedDate;

  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherData>((event, emit) async {
      try {
        WeatherFactory wf = WeatherFactory(
          ApiKey.weatherApiKey,
          language: Language.DANISH,
        );

        Weather w = await wf.currentWeatherByCityName(cityName);
        emit(Weathersuccess(w));
      } catch (e) {
        print(e);
        emit(WeatherFailure());
      }
    });
    on<UpdateForecastData>((event, emit) async {
      emit(Weathersuccess(updatedDate));
    });
  }

  void getWeatherFromForcast(Weather singleInstance) {
    updatedDate = singleInstance;
  }
}

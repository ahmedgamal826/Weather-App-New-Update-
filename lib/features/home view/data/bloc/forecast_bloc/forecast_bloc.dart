import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/core/utils/api_key.dart';
import 'package:weather_app/core/utils/shared.dart';
import 'package:weather_app/features/home%20view/data/bloc/forecast_bloc/forecast_event.dart';
import 'package:weather_app/features/home%20view/data/bloc/forecast_bloc/forecast_state.dart';

class ForecasteBloc extends Bloc<ForecasteEvent, ForecasteState> {
  String city = Shared.getString(key: "city");

  ForecasteBloc() : super(ForecasteInitial()) {
    on<FetchWeahterForecaste>((event, emit) async {
      try {
        WeatherFactory wf = WeatherFactory(
          ApiKey.weatherApiKey,
          language: Language.DANISH,
        );
        List<Weather> forecast = await wf.fiveDayForecastByCityName(city);
        // forecast.forEach((forecaste){
        //   print(forecast);
        // });
        emit(WeatherForecasteSuccess(forecast));
      } catch (e) {
        emit(Weatherfailure());
      }
    });
  }
}

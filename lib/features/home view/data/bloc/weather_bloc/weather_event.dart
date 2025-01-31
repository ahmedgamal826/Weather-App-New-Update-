import 'package:meta/meta.dart';

@immutable
sealed class WeatherEvent {
  const WeatherEvent();
}

// Event to fetch weather data
class FetchWeatherData extends WeatherEvent {
  const FetchWeatherData();
}

// Event to update forecast data
class UpdateForecastData extends WeatherEvent {
  const UpdateForecastData();
}

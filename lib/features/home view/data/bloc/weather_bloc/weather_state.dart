import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherFailure extends WeatherState {}

final class Weathersuccess extends WeatherState {
  final Weather weather;

  Weathersuccess(this.weather);
}

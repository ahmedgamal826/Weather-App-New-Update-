import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

@immutable
sealed class ForecasteState {}

final class ForecasteInitial extends ForecasteState {}

final class Weatherfailure extends ForecasteState {}

final class WeatherForecasteSuccess extends ForecasteState {
  final List<Weather> forecaste;

  WeatherForecasteSuccess(this.forecaste);
}

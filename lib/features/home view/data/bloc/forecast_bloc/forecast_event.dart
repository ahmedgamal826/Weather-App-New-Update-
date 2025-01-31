import 'package:meta/meta.dart';

@immutable
sealed class ForecasteEvent {}

class FetchWeahterForecaste extends ForecasteEvent {}

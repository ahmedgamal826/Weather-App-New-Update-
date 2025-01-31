import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/functions.dart';
import 'package:weather_app/features/home%20view/data/bloc/forecast_bloc/forecast_bloc.dart';
import 'package:weather_app/features/home%20view/data/bloc/forecast_bloc/forecast_state.dart';
import 'package:weather_app/features/home%20view/data/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/features/home%20view/data/bloc/weather_bloc/weather_event.dart';
import 'package:weather_app/features/home%20view/presentation/views/widgets/custom_card_list.dart';

class CustomListForecast extends StatelessWidget {
  const CustomListForecast({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<ForecasteBloc, ForecasteState>(
      builder: (context, state) {
        if (state is WeatherForecasteSuccess) {
          return Container(
            height: 160,
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: ListView.separated(
                separatorBuilder: (context, no_) => Container(
                      width: 20,
                    ),
                scrollDirection: Axis.horizontal,
                itemCount: state.forecaste.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      BlocProvider.of<WeatherBloc>(context)
                        ..getWeatherFromForcast(state.forecaste[index])
                        ..add(const UpdateForecastData());
                    },
                    child: CustomCardList(
                      image: "${getWeatherIcon(
                        state.forecaste[index].weatherConditionCode!,
                      )}",
                      title: "${DateFormat("dd/MM").add_jm().format(
                            state.forecaste[index].date!,
                          )}",
                      value: "${state.forecaste[index].temperature}",
                    ),
                  );
                }),
          );
        } else {
          return Container(
            margin: const EdgeInsets.all(25),
            child: CircularProgressIndicator(
              color: isDark ? Colors.white : Colors.blueAccent[100],
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/functions.dart';
import 'package:weather_app/core/utils/shared.dart';
import 'package:weather_app/features/home%20view/data/bloc/forecast_bloc/forecast_bloc.dart';
import 'package:weather_app/features/home%20view/data/bloc/forecast_bloc/forecast_event.dart';
import 'package:weather_app/features/home%20view/data/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/features/home%20view/data/bloc/weather_bloc/weather_event.dart';
import 'package:weather_app/features/home%20view/data/bloc/weather_bloc/weather_state.dart';
import 'package:weather_app/features/home%20view/presentation/views/welcome_view.dart';
import 'package:weather_app/features/search%20view/presentation/views/widgets/bad_response_page.dart';
import 'package:weather_app/features/home%20view/presentation/views/widgets/custom_list_forecast.dart';
import 'package:weather_app/features/home%20view/presentation/views/widgets/custom_row.dart';
import 'package:weather_app/features/home%20view/presentation/views/widgets/custom_stack.dart';
import 'package:weather_app/features/home%20view/presentation/views/widgets/custom_text_divider.dart';
import 'package:weather_app/features/home%20view/presentation/views/widgets/location_and_date.dart';
import 'package:weather_app/main.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool hasSearched = Shared.getBOOL(key: "hasSearched") ?? false;

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xff1E1B20) : Colors.white,
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/7.png',
                    height: height * 0.25,
                  ),
                  const Text(
                    "Weather App",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 2),
                  Card(
                    child: ListTile(
                      leading: const Text(
                        "Dark Mode",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      trailing: Switch(
                        value:
                            WeatherApp.themeManager.themeMode == ThemeMode.dark,
                        onChanged: (value) {
                          WeatherApp.themeManager.toggleTheme(value);
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor:
            isDark ? const Color(0xff2C2C2C) : Colors.blueAccent[100],
        centerTitle: true,
        title: InkWell(
          onTap: () {
            setState(() {
              hasSearched = true;
            });
            weatherBloc.add(const FetchWeatherData());
          },
          child: const Text(
            "Weather App",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/searchCityView');
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: hasSearched
          ? BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is Weathersuccess) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          LocationAndDate(
                            location: state.weather.areaName.toString(),
                            day: DateFormat("EEEE").format(state.weather.date!),
                            date: DateFormat("dd").format(state.weather.date!),
                            month:
                                DateFormat("MMMM").format(state.weather.date!),
                            time: DateFormat()
                                .add_jm()
                                .format(state.weather.date!),
                          ),
                          const SizedBox(height: 50),
                          CustomStack(
                            temp:
                                '${state.weather.temperature!.celsius!.round()}',
                            desc: '${state.weather.weatherMain!.toUpperCase()}',
                            icon: getWeatherIcon(
                                state.weather.weatherConditionCode!),
                          ),
                          const SizedBox(height: 30),
                          CustomRow(
                            temp_max: state.weather.tempMax.toString(),
                            temp_min: state.weather.tempMin.toString(),
                            feelLike: state.weather.tempFeelsLike.toString(),
                            sunrise: state.weather.sunrise == null
                                ? "Null"
                                : DateFormat()
                                    .add_jm()
                                    .format(state.weather.sunrise!),
                            sunset: state.weather.sunrise == null
                                ? "Null"
                                : DateFormat()
                                    .add_jm()
                                    .format(state.weather.sunset!),
                            windSpeed:
                                "${state.weather.windSpeed.toString()} KM/H",
                          ),
                          const SizedBox(height: 5),
                          const CustomTextDivider(header: 'Forecast'),
                          BlocProvider(
                            create: (context) =>
                                ForecasteBloc()..add(FetchWeahterForecaste()),
                            child: const CustomListForecast(),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (state is WeatherFailure) {
                  return const BadResponsePage();
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: isDark ? Colors.white : Colors.blueAccent[100],
                    ),
                  );
                }
              },
            )
          : const WelcomeView(),
    );
  }
}

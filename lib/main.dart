import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/themes/dark_theme.dart';
import 'package:weather_app/core/themes/light_theme.dart';
import 'package:weather_app/core/themes/theme_manager.dart';
import 'package:weather_app/core/utils/shared.dart';
import 'package:weather_app/features/home%20view/data/bloc/forecast_bloc/forecast_bloc.dart';
import 'package:weather_app/features/home%20view/data/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/features/home%20view/data/bloc/weather_bloc/weather_event.dart';
import 'package:weather_app/features/search%20view/presentation/views/search_city_view.dart';
import 'package:weather_app/features/home%20view/presentation/views/home_view.dart';
import 'package:weather_app/features/splash%20view/data/splash_view_logic.dart';
import 'package:weather_app/features/splash%20view/presentations/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewLogic()),
        BlocProvider<WeatherBloc>(
          create: (context) =>
              WeatherBloc(), // Ensure the WeatherBloc is created here
        ),
        BlocProvider<ForecasteBloc>(
          create: (context) =>
              ForecasteBloc(), // Ensure the ForecasteBloc is created here
        ),
      ],
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatefulWidget {
  WeatherApp({super.key});

  static ThemeManager themeManager = ThemeManager();

  @override
  State<WeatherApp> createState() => _MyAppState();
}

class _MyAppState extends State<WeatherApp> {
  @override
  void dispose() {
    WeatherApp.themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    WeatherApp.themeManager.toggleTheme(Shared.getBOOL(key: "isDark"));
    WeatherApp.themeManager.addListener(themeListener);
    super.initState();
  }

  void themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: WeatherApp.themeManager.themeMode,
      routes: {
        '/': (context) => SplashView(),
        '/home': (context) => BlocProvider(
              create: (context) => WeatherBloc()
                ..add(
                  const FetchWeatherData(),
                ),
              child: const HomeView(),
            ),
        '/searchCityView': (context) => const SearchCityView(),
      },
    );
  }
}

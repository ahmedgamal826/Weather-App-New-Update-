import 'package:flutter/material.dart';
import 'package:weather_app/features/home%20view/presentation/views/widgets/custom_card.dart';

class CustomRow extends StatelessWidget {
  final String temp_max;
  final String temp_min;
  final String feelLike;
  final String sunrise;
  final String sunset;
  final String windSpeed;

  CustomRow({
    required this.temp_max,
    required this.temp_min,
    required this.feelLike,
    required this.sunrise,
    required this.sunset,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomCard(
            image: "assets/images/16.gif",
            tittle: "Temp(MIN)",
            value: temp_min),
        CustomCard(
            image: "assets/images/15.gif",
            tittle: "Temp(MAX)",
            value: temp_max),
        CustomCard(
            image: "assets/images/17.gif",
            tittle: "Wind Speed",
            value: windSpeed),
        CustomCard(
            image: "assets/images/13.png",
            tittle: "Feel Like",
            value: feelLike),
        CustomCard(
          image: "assets/images/6.png",
          tittle: "Sunrise",
          value: sunrise,
        ),
        CustomCard(
          image: "assets/images/12.png",
          tittle: "Sunset",
          value: sunset,
        ),
      ]),
    );
  }
}

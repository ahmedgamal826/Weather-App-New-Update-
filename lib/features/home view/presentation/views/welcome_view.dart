import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_outlined,
            size: 100,
            color: isDark ? Colors.white : Colors.blueAccent[100],
          ),
          const SizedBox(height: 20),
          const Text(
            "Welcome to Weather App!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Search for a city to get started.",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(15),
              backgroundColor:
                  isDark ? const Color(0xff2C2C2C) : Colors.blueAccent[100],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/searchCityView');
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: const Text(
              "Search for a city",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

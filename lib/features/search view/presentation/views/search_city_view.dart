import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather_app/core/utils/shared.dart';
import 'package:weather_app/features/search%20view/presentation/views/widgets/custom_text_field.dart';

class SearchCityView extends StatefulWidget {
  const SearchCityView({super.key});

  @override
  State<SearchCityView> createState() => _SearchCityViewState();
}

class _SearchCityViewState extends State<SearchCityView> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  List<String> cities = Shared.getList(key: "cities") ?? [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor:
            isDark ? const Color(0xff2C2C2C) : Colors.blueAccent[100],
        title: const Text(
          "Locations",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 5,
              color: isDark ? const Color(0xff2C2C2C) : Colors.blueAccent[100],
              child: ListTile(
                title: Text(
                  cities[index],
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Shared.putString(key: "city", value: cities[index]);
                  Shared.putBOOL(key: "hasSearched", value: true);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/home",
                    (Route<dynamic> route) => false,
                  );
                },
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      cities.removeAt(index);
                      Shared.putList(key: "cities", value: cities);
                    });
                  },
                  icon: const Icon(Icons.delete_forever),
                  color: Colors.redAccent,
                ),
              ).animate().fadeIn(duration: 300.ms),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 10,
          right: 10,
        ),
        child: CustomTextField(
          controller: _controller,
          focusNode: _focusNode,
          onFieldSubmitted: (value) {
            _submitCity(value);
          },
          onPressed: () {
            _submitCity(_controller.text);
          },
        ),
      ),
    );
  }

  void _submitCity(String city) {
    city = city.trim(); // Remove any extra spaces

    if (city.isNotEmpty) {
      setState(() {
        cities.add(city);
        Shared.putString(key: "city", value: city);
        Shared.putList(key: "cities", value: cities);
        Shared.putBOOL(key: "hasSearched", value: true);
      });
      _controller.clear();
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/home",
        (Route<dynamic> route) => false,
      );
    }
  }
}

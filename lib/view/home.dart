import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherforecastapplication/controll/apicontroll.dart';


class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String city = 'New Delhi'; // Default city

  @override
  Widget build(BuildContext context) {
    final weather = context.watch<WeatherProvider>().weather;

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Enter city name',
                      prefixIcon: Icon(Icons.location_on_sharp),
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () async {
                              // Fetch weather data for the entered city
                            // Validate user input (optional)
                              if (RegExp(r'^[a-zA-Z\s]+$').hasMatch(city)) {
                                await context.read<WeatherProvider>().fetchWeather(city);
                              } else {
                                // Show error message or prevent fetch (optional)
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              // Add your onPressed logic here
                            },
                          ), // Added missing closing bracket here
                        ],
                      ),
                    ),
                  ),
                ),

               Container(
  height: 200,
  width: 400,
  color: Colors.blue,
  child: Center(  // Center the text within the box
    child: Text(
      '${weather?.temperature}°C - ${weather?.description}',  // Assuming weather has properties like temperature and description
      style: TextStyle(fontSize: 20, color: Colors.white),
    ),
  ),
)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

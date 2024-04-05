import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:weatherforecastapplication/model/model.dart'; // Assuming you have Weather model defined
import 'dart:convert';

import 'package:weatherforecastapplication/controll/apikey.dart'; // Assuming API key file

final weatherProvider = ChangeNotifierProvider<WeatherProvider>(
  create: (context) => WeatherProvider(),
);

class WeatherProvider with ChangeNotifier {
  Weather? weather;

  // Method to fetch weather data for a given city
  Future<void> fetchWeather(String city) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      
      // Assuming the structure of the JSON response matches this
      weather = Weather(
        city: data['city'],
        temperature: data['main']['temp'].toDouble(),
        description: data['weather'][0]['description'],
        feelsLike: data['main']['feels_like'].toDouble(),
        humidityDescription: 'Humidity is making it feel cooler', // Placeholder
      );
      
      notifyListeners(); // Notify listeners about weather update
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

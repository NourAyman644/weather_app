import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class weatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '01f273ba7d7a42f8b8d222705232907';

  Future<weatherModel> getWeather({required String city}) async {
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');
    http.Response response = await http.get(url);


    Map<String, dynamic> data = jsonDecode(response.body);
   //var jsonData = data['forecast']['forecastday'][0];
    weatherModel weather = weatherModel.fromjson(data);

    return weather;
  }
}

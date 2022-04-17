import 'dart:convert';
import '../network/weather.dart';
import 'package:http/http.dart' as http;

class GetData{
  Future<Weather> getCurrentWeather(String location) async {
    var urlApi = Uri.parse('http://api.weatherapi.com/v1/current.json?key=da1d665b6e0143f39be85704210211&q=$location&aqi=yes');
    var request = await http.get(urlApi);
    var body = jsonDecode(request.body);

    return Weather.fromJson(body);
  }
}
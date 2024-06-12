import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as https;
import 'package:weather_app_task/infrastructure/commons/constants/api_constants.dart';
import 'package:weather_app_task/infrastructure/models/weather_data_model.dart';

class WeatherServiceProvider with ChangeNotifier {
  ChangeNotifierProviderRef<WeatherServiceProvider> ref;

  WeatherServiceProvider(this.ref);

  WeatherDataModel? get weatherResponseData => _weatherResponseData;
  WeatherDataModel? _weatherResponseData;

  Future getWeatherDataAPI(BuildContext context, {required String name}) async {
    String url =
        "${ApiConstants.baseUrl}/weather?q=$name&appid=${ApiConstants.apikey}";
    final response = await https.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        _weatherResponseData = WeatherDataModel.fromJson(jsonResponse);
        return WeatherDataModel.fromJson(jsonResponse);
      } else if (response.statusCode == 400) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Server not found')));
      } else {
        throw Exception('Cant fetch data from api');
      }
    } catch (e) {}
  }
}

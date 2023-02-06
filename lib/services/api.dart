import 'dart:convert';

import 'package:http/http.dart';
import 'package:weatherapp/model/weathwe_model.dart';

class Api{

static Future<WeatherModel> getMethod() async {
 
 var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Navoiy&units=metric&appid=6586eb96f640f4b3a3181ffd0f38a3c4");

 Response response = await get(url);
 print(response.body);

 return WeatherModel.fromJson(jsonDecode(response.body));

}

}
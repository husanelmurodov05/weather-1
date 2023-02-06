class WeatherModel{
  int? temp;
  //int? snow;
  int? hum;
  int? speed;
  String? name;

  WeatherModel(this.temp,this.hum,this.speed,this.name);

  WeatherModel.fromJson(Map<String,dynamic> json){
   temp = (json["main"]["temp"] as double).round();
   //snow = (json["snow"]?["1h"] as double).round() ?? 0;
   hum = json["main"]["humidity"];
   speed = (json["wind"]["speed"] as num).round();
   name = json["name"];
  }


}
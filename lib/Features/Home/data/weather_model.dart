class WeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;
  WeatherModel({this.location, this.current, this.forecast});
  WeatherModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ?  Location.fromJson(json['location'])
        : null;
    current =
    json['current'] != null ?  Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null
        ?  Forecast.fromJson(json['forecast'])
        : null;
  }
}

class Location {
  String? name;
  String? localtime;
  Location({this.name, this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    localtime = json['localtime'];
  }

}

class Current {
  num? tempC;
  Condition? condition;
  Current(
      {
        this.tempC,

        this.condition,});


  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    condition = json['condition'] != null ?  Condition.fromJson(json['condition']) : null;
  }

}

class Condition {
  String? text;
  Condition({this.text,});
  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }
}
class Forecast {
  List<Forecastday>? forecastday;
  Forecast({this.forecastday});
  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(Forecastday.fromJson(v));
      });
    }
  }
}
class Forecastday {
  String? date;
  Day? day;
  Forecastday({this.date, this.day, });
  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'] != null ?  Day.fromJson(json['day']) : null;
    }
  }
class Day {
  num? avgtempC;
  Day(
      {
        this.avgtempC,
      });
  Day.fromJson(Map<String, dynamic> json) {
    avgtempC = json['avgtemp_c'];
  }


}



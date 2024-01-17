class WeatherModel {
  List<Weather> weather;
  Main main;
  Wind wind;
  int visibility;
  Rain rain;

  WeatherModel({
    required this.weather,
    required this.main,
    required this.wind,
    required this.visibility,
    required this.rain,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        weather: json["weather"] == null
            ? []
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json["main"] ?? {}),
        wind: Wind.fromJson(json["wind"] ?? {}),
        visibility: json["visibility"] ?? 0,
        rain: Rain.fromJson(json["rain"] ?? {}),
      );
}

class Main {
  dynamic temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  int pressure;
  int humidity;
  int seaLevel;
  int grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"] ?? 0.0,
        feelsLike: json["feels_like"] ?? 0.0,
        tempMin: json["temp_min"] ?? 0.0,
        tempMax: json["temp_max"] ?? 0.0,
        pressure: json["pressure"] ?? 0,
        humidity: json["humidity"] ?? 0,
        seaLevel: json["sea_level"] ?? 0,
        grndLevel: json["grnd_level"] ?? 0,
      );
}

class Rain {
  dynamic the1H;

  Rain({
    required this.the1H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"]??0.0,
      );
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] ?? 0,
        main: json["main"] ?? "",
        description: json["description"] ?? "",
        icon: json["icon"] ?? "",
      );
}

class Wind {
  dynamic speed;
  int deg;
  dynamic gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"] ?? 0.0,
        deg: json["deg"] ?? 0,
        gust: json["gust"] ?? 0.0,
      );
}

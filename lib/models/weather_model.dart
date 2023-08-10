import 'package:flutter/material.dart';

class weatherModel {
  String date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherstatename;
  double humidity;
  double wind;
  double chanceOfRain;
  weatherModel(
      {
        required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherstatename,
        required this. chanceOfRain,
      required this.humidity,
      required this.wind,


      });

  factory weatherModel.fromjson(dynamic data) {
    // var jsonData = data["forecast"]["forecastday"][0]["day"];
    var jsonData = data["forecast"]["forecastday"][0]["day"];

    // print(jsonData);
//  print('temp =${ jsonData['avgtemp_c']}');
    //  temp=jsonData['avgtemp_c'];
    //  maxtemp=jsonData['maxtemp_c'];
    //  mintemp=jsonData['mintemp_c'];
    //  date=data['location']['localtime'];
    // weatherstatename=jsonData['condition']['text'];
    return weatherModel(
      date: data['location']['localtime'],
      temp: jsonData["avgtemp_c"],
      maxtemp: jsonData['maxtemp_c'],
      mintemp: jsonData["mintemp_c"],
      weatherstatename: jsonData["condition"]['text'],
        humidity: (jsonData['avghumidity'] as num?)!.toDouble(),
        wind:(jsonData['maxwind_kph'] as num?)!.toDouble(),
        chanceOfRain:( jsonData['daily_chance_of_rain'] as num?)!.toDouble()
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'temp =$temp mintemp=$mintemp watherstate=$weatherstatename';
  }

  String getImage(){
    if(weatherstatename=="Sunny" || weatherstatename=="Clear" ){
      return 'assents/images/sun1.png';
    }

    else if(
      weatherstatename=="Partly cloudy" ||weatherstatename=="Cloudy" ||
          weatherstatename=="Overcast" ||weatherstatename=="Mist"||
          weatherstatename=='Thundery outbreaks in nearby' ){
      return 'assents/images/Cloudy_w.png';
    }

    else if(weatherstatename=="Patchy rain possible"||weatherstatename==' Patchy light rain'||
        weatherstatename=='Light rain'||weatherstatename=='Moderate rain at times'||
        weatherstatename=='Moderate rain'|| weatherstatename=='Light rain shower'||
        weatherstatename=='Patchy light rain with thunder'||
        weatherstatename==''){
      return 'assents/images/rainy.png';
    }

    else if(weatherstatename=="Patchy snow possible"||weatherstatename=="Patchy sleet possible"||
        weatherstatename=="atchy snow possible"||weatherstatename=="Patchy freezing drizzle possible"||
        weatherstatename=='Blowing snow'||weatherstatename=='Blizzard'||weatherstatename=='Freezing fog'||
        weatherstatename=='Freezing drizzle'||weatherstatename=='Heavy freezing drizzle'||
        weatherstatename=='Light freezing rain'||weatherstatename=='Moderate or heavy freezing rain'||
        weatherstatename=='Light sleet'||weatherstatename=='Moderate or heavy sleet'||
        weatherstatename=='Patchy light snow'||weatherstatename=='Light snow'
        ||weatherstatename=='Patchy moderate snow'||weatherstatename=='Moderate snow'||
        weatherstatename=='Patchy heavy snow'||weatherstatename=='Heavy snow'||
        weatherstatename=='Ice pellets'||weatherstatename=='Light sleet showers'||
        weatherstatename=='Moderate or heavy sleet showers'||weatherstatename==''
        ||weatherstatename=='Light snow showers'||weatherstatename=='Moderate or heavy snow showers'
        ||weatherstatename=='Light showers of ice pellets'||
        weatherstatename=='Moderate or heavy showers of ice pellets'||
        weatherstatename=='Patchy light snow with thunder'||weatherstatename=='Moderate or heavy snow with thunder'
    )
    {
      return 'assents/images/snowy.png';
    }

    else if(weatherstatename=="Fog"||weatherstatename=='Patchy light drizzle' ||
        weatherstatename=='Light drizzle'||weatherstatename=='Light drizzle'){
      return 'assents/images/thunder_storm.png.png';

    }

    else if(weatherstatename=='Heavy rain at times'||weatherstatename=='Heavy rain'||
        weatherstatename=='Moderate or heavy rain shower'||weatherstatename=='Torrential rain shower'||
        weatherstatename=='Moderate or heavy rain with thunder'||weatherstatename==''){
      return 'assents/images/rainy.png';
    }

    else{
      return  'assents/images/sun1.png';
    }
    }


  BoxDecoration get_color() {
    if (weatherstatename == "Sunny" || weatherstatename == "Clear") {
      return const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xffefb43d),
         // Color(0xff0089be),
          Colors.greenAccent,
          Color(0xff30BCE5),
        ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
      ));
    } else if (weatherstatename == 'Patchy sleet nearby' ||
        weatherstatename == 'Patchy snow nearby' ||
        weatherstatename == 'Patchy freezing drizzle nearby') {
      return const BoxDecoration(
          gradient: LinearGradient(
        colors: [

          Color(0xFF3fa2fa),
          Color(0xFF955cd1),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ));
    } else if (weatherstatename == 'Partly cloudy' ||
        weatherstatename == 'Cloudy' ||
        weatherstatename == 'Overcast' ||
        weatherstatename == 'Mist') {
      return const BoxDecoration(
          gradient: LinearGradient(
        colors: [

          Color(0xFF3fa2fa),
          Color(0xFF955cd1),
        ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
      ));
    } else if (weatherstatename == 'Patchy rain nearby' ||
        weatherstatename == 'Patchy light drizzle' ||
        weatherstatename == 'Moderate rain' ||
        weatherstatename == 'Patchy rain possible') {
      return const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          // Color(0xFF955cd1),
         // Color(0xFF3fa2fa),
          Color(0xff082654),
          Color(0xff0C43AC),
           Colors.lightBlue,
        ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
      ));
    } else if (weatherstatename == 'Thundery outbreaks in nearby' ||
        weatherstatename == 'Blizzard' ||
        weatherstatename == 'Fog') {
      return const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF955cd1),
        Color(0xFF3fa2fa),
      ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ));
    } else {
      return const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xffefb43d),
          //Color(0xff0089be),
          Colors.greenAccent,
          Color(0xff30BCE5),
        ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
      )
      );
    }
  }
}

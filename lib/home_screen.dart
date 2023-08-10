import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather%20provider.dart';
import 'package:weather_app/search%20screen.dart';

import 'models/weather_model.dart';

class home_screen extends StatefulWidget {
  @override
  State<home_screen> createState() => _home_screenState();
}

LinearGradient rainingGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Colors.white.withOpacity(0.8),
    Colors.white.withOpacity(0.8),
    // Color.fromRGBO(8, 33, 76, 1),
    //Color.fromRGBO(6, 111, 192, 0.9),
    //Color.fromRGBO(8, 33, 76, 1),
  ],
);

class _home_screenState extends State<home_screen> {
  void updateUi() {
    setState(() {});
  }

  weatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<weatherProvider>(context).weatherData;
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text(' weather app'),
      // ),
      body: weatherData == null
          ? Center(
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                 SizedBox(
                  // width: double.infinity,
                    child: Image.asset(
                      'assents/images/lock.png',
                     // width: 300,
                    ),
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                  const Text('Discover the Weather',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const Text(
                    'in Your City',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 30,),
                  Text('Get know your weather and forecast',style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),),
                  SizedBox(height: 80,),
                  Container(
                    height: 80,
                    margin: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 40),
                    padding: const EdgeInsets.all(9),

                    width: double.infinity,
                    decoration: BoxDecoration(
                       // gradient: rainingGradient,
                        borderRadius: BorderRadius.circular(100)),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return search_screen(
                              updateUi: updateUi,
                            );
                          }),
                        );
                      },
                      child: const Text(
                        'Get started',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 16,
                  ),
                ],
              ),
            )
          : Container(
              decoration: weatherData!.get_color(),
              child: Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 6,
                      ),
                      const Icon(
                        CupertinoIcons.arrow_left,
                        color: Colors.white,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.placemark,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                              Provider.of<weatherProvider>(context).cityName ??
                                  '',
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      IconButton(
                        icon: const Icon(
                          CupertinoIcons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return search_screen(
                                updateUi: updateUi,
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text("Today's Report",
                            //textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: Image.asset(weatherData!.getImage()),
                  ),
                  // Text(Provider.of<weatherProvider>(context).cityName ?? '',
                  //     style: const TextStyle(
                  //         fontSize: 45,
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold)),
                  Text(
                      // weatherData?.weatherstatename ??' ', // null check operator
                      "it's ${weatherData!.weatherstatename}", //not null
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      //weatherData!.temp.toInt().toString(), ==
                      '${weatherData!.temp.toInt()}°c',
                      style: const TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        padding: const EdgeInsets.all(9),
                        height: 70,
                        width: 140,
                        decoration: BoxDecoration(
                            gradient: rainingGradient,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.nightlight_outlined),
                                Text('MinTemp ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                            Text('${weatherData!.mintemp.toInt()}°c',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding: const EdgeInsets.all(9),
                        height: 70,
                        width: 140,
                        decoration: BoxDecoration(
                            gradient: rainingGradient,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Icon(CupertinoIcons.sun_max),
                                Text('MaxTemp',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                            Text("${weatherData!.maxtemp.toInt()}°c",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: rainingGradient,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Icon(
                              CupertinoIcons.cloud_rain_fill,
                              color: Colors.blue,
                              size: 30,
                            ),
                            Text(' ${weatherData!.chanceOfRain.toInt()}%',
                                style: const TextStyle(
                                  fontSize: 25,
                                  //color: Colors.white,
                                )),
                            const Text(
                              'chance of rain',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(
                              CupertinoIcons.wind,
                              size: 30,
                            ),
                            Text(
                              ' ${weatherData!.wind.toInt()} km/h',
                              style: const TextStyle(
                                fontSize: 24,
                                // fontWeight: FontWeight.bold,
                                // color: Colors.white,
                              ),
                            ),
                            const Text(
                              'wind',
                              style: TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                // color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.water_drop_outlined,
                              size: 30,
                              color: Colors.blue,
                            ),
                            Text(
                              '${weatherData!.humidity.toInt()}%',
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            const Text(
                              'humidity',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  )
                ],
              ),
            ),
    );
  }
}

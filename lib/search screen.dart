import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather%20provider.dart';
import 'package:weather_app/services/weather_services.dart';

class search_screen extends StatelessWidget {



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
  String? city_name;

   VoidCallback? updateUi;
search_screen({ this.updateUi});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Search a City'),
        centerTitle: true,

      ),
      body:  Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF030E26),
            Colors.indigo,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter)
        ),

        child: Column(
                children: [
                  Image.asset('assents/images/search.png'),
                  // const Spacer(
                  //   flex: 1,
                  // ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        onSubmitted: (data) async {
                          city_name = data;
                          weatherServices services = weatherServices();
                          weatherModel? weather = await services.getWeather(city: city_name!);
                           Provider.of<weatherProvider>(context, listen: false).weatherData=weather;
                            //updateUi!();
                          Provider.of<weatherProvider>(context, listen: false).cityName=city_name;
                           Navigator.pop(context);

                        },
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a city',
                          focusColor: Colors.white,
                          label: Text(
                            'Search',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  // const Icon(
                  //   Icons.search_off_outlined,
                  //   size: 200,
                  //   color: Colors.indigo,
                  // ),
                  // const Spacer(
                  //   flex: 4,
                  // ),
                ],
              ),
      )

    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/home_screen.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather%20provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  weatherModel ?weather;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
          return weatherProvider();

      },
      child: MaterialApp(

        home: home_screen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF030E26),

            elevation: 0.0,
          ),

          scaffoldBackgroundColor: const Color(0xFF030E26),
          inputDecorationTheme:  InputDecorationTheme(
              contentPadding: const EdgeInsets.all(25),
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            enabledBorder: OutlineInputBorder(

              borderSide: BorderSide( width:4,color: Colors.white),
              borderRadius: BorderRadius.circular(35),
            ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 4, color: Colors.indigo),
                borderRadius: BorderRadius.circular(35),
            )
          ),
        ),
      ),
    );
  }
}

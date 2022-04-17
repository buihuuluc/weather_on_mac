import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/screens/homepage.dart';
import 'screens/aqipage.dart';
import 'screens/searchpage.dart';
import 'screens/mappage.dart';

class WeatherApp extends StatefulWidget {
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            extendBodyBehindAppBar: true, //View through Appbar
            appBar: AppBar(
              toolbarHeight: 36,
              title: Text(''),
              bottom: TabBar(
                tabs: [
                  Tab(
                      icon: Icon(
                        Icons.cloud,
                      )),
                  Tab(
                      icon: Icon(
                        Icons.wb_sunny,
                      )),
                  Tab(
                      icon: Icon(
                        Icons.search,
                      )),
                  Tab(
                      icon: Icon(
                        Icons.map,
                      )),
                ],
              ),
              backgroundColor: Colors.transparent, // Transparent Appbar
              elevation: 0.0, //Remove Shadow of AppBar in Android
            ),
            body: TabBarView(
              children: [
                HomePage(),
                AQIPage(),
                SearchPage(),
                MapScreen(),
              ],
            ),
          ),
        ));
  }
}
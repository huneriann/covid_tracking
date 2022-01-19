import 'package:covid_tracking/widgets/countryDayOneRouteWidget.dart';
import 'package:covid_tracking/widgets/detailsCountryDayOneRouteWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID Tracking',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CountryDayOneRouteWidget(),
      },
    );
  }
}

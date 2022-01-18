import 'dart:async';

import 'package:covid_tracking/model/countryDayOneRoute.dart';
import 'package:covid_tracking/service/covid19ApiService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CountryDayOneRouteWidget extends StatefulWidget {
  const CountryDayOneRouteWidget({Key? key}) : super(key: key);
  @override
  State<CountryDayOneRouteWidget> createState() =>
      _CountryDayOneRouteWidgetState();
}

class _CountryDayOneRouteWidgetState extends State<CountryDayOneRouteWidget> {
  Covid19ApiService service = Covid19ApiService();

  late Future<List<CountryDayOneRoute>> list;

  Future<List<CountryDayOneRoute>> GetData() async {
    return await service.getCountryDayOneRoute('Azerbaijan');
  }

  @override
  void initState() {
    super.initState();

    list = GetData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return const Center(
            child: Text('Connection failed'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: (snapshot.data as List<CountryDayOneRoute>).length,
            itemBuilder: (context, index) {
              return Container(
                child: Text(
                    '${(snapshot.data as List<CountryDayOneRoute>)[index].date}'),
              );
            });
      },
    );
  }
}

import 'package:covid_tracking/widgets/detailsCountryDayOneRouteWidget.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'package:covid_tracking/model/countryDayOneRoute.dart';
import 'package:covid_tracking/service/covid19ApiService.dart';

class CountryDayOneRouteWidget extends StatefulWidget {
  const CountryDayOneRouteWidget({Key? key}) : super(key: key);
  @override
  State<CountryDayOneRouteWidget> createState() =>
      _CountryDayOneRouteWidgetState();
}

class _CountryDayOneRouteWidgetState extends State<CountryDayOneRouteWidget> {
  Covid19ApiService service = Covid19ApiService();

  late Future<List<CountryDayOneRoute>> list;

  Future<List<CountryDayOneRoute>> getData() async {
    return await service.getCountryDayOneRoute('Azerbaijan');
  }

  @override
  void initState() {
    super.initState();

    list = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID Tracking'),
      ),
      body: FutureBuilder(
        future: getData(),
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
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount:
                        (snapshot.data as List<CountryDayOneRoute>).length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsCountryDayOneRouteWidget(
                                      todaysData: (snapshot.data
                                          as List<CountryDayOneRoute>)[index],
                                      yesterdayssData: index !=
                                              (snapshot.data as List<
                                                          CountryDayOneRoute>)
                                                      .length -
                                                  1
                                          ? (snapshot.data as List<
                                              CountryDayOneRoute>)[index + 1]
                                          : (snapshot.data as List<
                                              CountryDayOneRoute>)[index],
                                    ),
                                  ));
                            },
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.black26),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(formatDate(DateTime.parse((snapshot.data
                                        as List<CountryDayOneRoute>)[index]
                                    .date
                                    .toString()))),
                                const Icon(Icons.chevron_right)
                              ],
                            )),
                      );
                    }),
              ),
            ],
          );
        },
      ),
    );
  }

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }
}

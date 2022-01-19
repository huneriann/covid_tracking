import 'package:covid_tracking/model/countryDayOneRoute.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsCountryDayOneRouteWidget extends StatefulWidget {
  final CountryDayOneRoute todaysData;
  final CountryDayOneRoute yesterdayssData;

  const DetailsCountryDayOneRouteWidget(
      {Key? key, required this.todaysData, required this.yesterdayssData})
      : super(key: key);

  @override
  State<DetailsCountryDayOneRouteWidget> createState() =>
      _DetailsCountryDayOneRouteWidgetState();
}

class _DetailsCountryDayOneRouteWidgetState
    extends State<DetailsCountryDayOneRouteWidget> {
  CountryDayOneRoute? todaysActualData;

  @override
  void initState() {
    super.initState();

    var today = widget.todaysData;
    var yesterday = widget.yesterdayssData;

    todaysActualData = CountryDayOneRoute();

    todaysActualData?.iD = today.iD;
    todaysActualData?.date = today.date;
    todaysActualData?.deaths = today.deaths! - yesterday.deaths!;
    todaysActualData?.active = today.active! - yesterday.active!;
    todaysActualData?.confirmed = today.confirmed! - yesterday.confirmed!;
    todaysActualData?.recovered = today.recovered! - yesterday.recovered!;
    todaysActualData?.country = today.country;
    todaysActualData?.province = today.province;
    todaysActualData?.city = today.city;
    todaysActualData?.cityCode = today.cityCode;
    todaysActualData?.lat = today.lat;
    todaysActualData?.lon = today.lon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(formatDate(DateTime.parse(widget.todaysData.date.toString()))),
      ),
      body: Column(
        children: [todaysActual(), dayOne()],
      ),
    );
  }

  Widget todaysActual() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              'Actual Information of ${todaysActualData?.country}',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        Center(
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        children: [
                          const Text(
                            'Death',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${todaysActualData?.deaths}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        children: [
                          const Text(
                            'Active',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${todaysActualData?.active}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        children: [
                          const Text(
                            'Confirmed',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${todaysActualData?.confirmed}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }

  Widget dayOne() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              'Cumulative Information of ${todaysActualData?.country}',
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
        Center(
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        children: [
                          const Text(
                            'Death',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${widget.todaysData.deaths}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        children: [
                          const Text(
                            'Active',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${widget.todaysData.active}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        children: [
                          const Text(
                            'Confirmed',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${widget.todaysData.confirmed}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }
}

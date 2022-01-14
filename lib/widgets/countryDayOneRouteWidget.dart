import 'package:covid_tracking/model/countryDayOneRoute.dart';
import 'package:covid_tracking/service/covid19ApiService.dart';
import 'package:flutter/material.dart';

class CountryDayOneRouteWidget extends StatefulWidget {
  const CountryDayOneRouteWidget({Key? key}) : super(key: key);
  @override
  State<CountryDayOneRouteWidget> createState() =>
      _CountryDayOneRouteWidgetState();
}

class _CountryDayOneRouteWidgetState extends State<CountryDayOneRouteWidget> {
  Covid19ApiService service = Covid19ApiService();

  Future<List<CountryDayOneRoute>>? list;

  void GetData() async {
    list = service.getCountryDayOneRoute('Azerbaijan');
  }

  @override
  void initState() {
    super.initState();
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //Reverse list
            var resList =
                List.from((snapshot.data as List<CountryDayOneRoute>).reversed);

            return ListView.builder(
                itemCount: resList.length,
                itemBuilder: (context, index) {
                  return Container(
                      color: Colors.black26,
                      margin: const EdgeInsets.all(1),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '${resList[index].date?.split('T')[0]}',
                                style: const TextStyle(
                                    fontSize: 11,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 2)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Column(
                                  children: [
                                    const Text('Confirmed',
                                        style: TextStyle(fontSize: 11)),
                                    Text(
                                      '${resList[index].confirmed}',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Column(
                                  children: [
                                    const Text('Active',
                                        style: TextStyle(fontSize: 11)),
                                    Text(
                                      '${resList[index].active}',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Column(
                                  children: [
                                    const Text('Deaths',
                                        style: TextStyle(fontSize: 11)),
                                    Text(
                                      '${resList[index].deaths}',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

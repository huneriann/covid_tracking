class CountryDayOneRoute {
  String? iD;
  String? country;
  String? countryCode;
  String? province;
  String? city;
  String? cityCode;
  String? lat;
  String? lon;
  int? confirmed;
  int? deaths;
  int? recovered;
  int? active;
  String? date;

  CountryDayOneRoute(
      {this.iD,
      this.country,
      this.countryCode,
      this.province,
      this.city,
      this.cityCode,
      this.lat,
      this.lon,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.active,
      this.date});

  CountryDayOneRoute.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    country = json['Country'];
    countryCode = json['CountryCode'];
    province = json['Province'];
    city = json['City'];
    cityCode = json['CityCode'];
    lat = json['Lat'];
    lon = json['Lon'];
    confirmed = json['Confirmed'];
    deaths = json['Deaths'];
    recovered = json['Recovered'];
    active = json['Active'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Country'] = this.country;
    data['CountryCode'] = this.countryCode;
    data['Province'] = this.province;
    data['City'] = this.city;
    data['CityCode'] = this.cityCode;
    data['Lat'] = this.lat;
    data['Lon'] = this.lon;
    data['Confirmed'] = this.confirmed;
    data['Deaths'] = this.deaths;
    data['Recovered'] = this.recovered;
    data['Active'] = this.active;
    data['Date'] = this.date;
    return data;
  }
}

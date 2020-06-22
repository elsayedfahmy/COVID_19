import 'package:flutter/material.dart';
class home_Model{
int cases,
todayCases,
deaths, today_Deaths, recovered,
todayRecovered, active, critical,
affectedCountries;

home_Model(
{this.cases,
      this.todayCases,
      this.deaths,
      this.today_Deaths,
      this.recovered,
      this.todayRecovered,
      this.active,
    this.critical,
      this.affectedCountries});

factory home_Model.fromJson(Map<String, dynamic> json) {
  return home_Model(
    cases: json['cases'],
    todayCases: json['todayCases'],
    deaths: json['deaths'],
    today_Deaths : json['todayDeaths'],
    recovered: json['recovered'],
    todayRecovered: json['todayRecovered'],
    active: json['active'],
    critical: json['critical'],
    affectedCountries: json['affectedCountries'],

  );
}
}
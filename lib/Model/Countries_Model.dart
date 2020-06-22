import 'package:flutter/material.dart';
class countries_Model{
  String country,flag;
  int cases,
  todayCases,
  deaths, today_Deaths, recovered,
  todayRecovered, active, critical;

  countries_Model({this.country, this.flag, this.cases, this.todayCases,
      this.deaths, this.today_Deaths, this.recovered, this.todayRecovered,
      this.active, this.critical});
  factory countries_Model.fromJson(Map<String, dynamic> json) {
    return countries_Model(
      country:json['country'],
      flag: json['countryInfo']['flag'],
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      today_Deaths : json['todayDeaths'],
      recovered: json['recovered'],
      todayRecovered: json['todayRecovered'],
      active: json['active'],
      critical: json['critical']
    );
  }



}
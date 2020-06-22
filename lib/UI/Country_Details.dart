import 'package:covidapp/API/fetch_data.dart';
import 'package:covidapp/Model/Countries_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utilities.dart';
class Country_Details extends StatefulWidget {
//  String country,flag;
//  int cases,
//      todayCases,
//      deaths, today_Deaths, recovered,
//      todayRecovered, active, critical;
  countries_Model countries_Model1;
//  Country_Details(this.country,this.flag,this.cases,this.todayCases,this.deaths,this.today_Deaths,this.recovered,this.todayRecovered
//      ,this.active,this.critical);
  Country_Details(this.countries_Model1);

  @override
  _Country_DetailsState createState() => _Country_DetailsState(countries_Model1);
}

class _Country_DetailsState extends State<Country_Details> {
countries_Model _countries_model;
  _Country_DetailsState(this._countries_model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_countries_model.country)
          ,centerTitle: false,),
        body: Container(
          child:Column(children: <Widget>[
            _draw_Container_header(_countries_model.flag),
           _draw_Container_footer(
                _countries_model.cases,
                _countries_model.todayCases,
                _countries_model.deaths,
                _countries_model.today_Deaths,
                _countries_model.recovered,
                _countries_model.todayRecovered,
                _countries_model.active,
                _countries_model.critical
            )


          ],)



        )
    );
  }

  _draw_Container_header(String flag) {
    return Container(
        //margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .3,
        decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(40.0),
            image: DecorationImage(
                image: NetworkImage(flag),
                fit: BoxFit.cover)),

    );
  }

_draw_Container_footer(
    int all_cases,
    int todayCases,
    int all_deaths,
    int today_Deaths,
    int all_recovered,
    int today_Recovered,
    int active,
    int critical,
    ) {
  return Container(
    margin: EdgeInsets.only(top: 30,left: 10,right: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.teal),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "cases: $all_cases",
                    style: TextStyle(color: text_color),
                  ),
                  Text(
                    "today: $todayCases",
                    style: TextStyle(color: text_color),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.cyan),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Deaths: $all_deaths",
                    style: TextStyle(color: text_color),
                  ),
                  Text(
                    "today:$today_Deaths",
                    style: TextStyle(color: text_color),
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.deepOrangeAccent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Recovered: $all_recovered",
                      style: TextStyle(color: text_color)),
                  Text(" today:$today_Recovered",
                      style: TextStyle(color: text_color))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.purple),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("active: $active", style: TextStyle(color: text_color)),
                  Text("critical: $critical",
                      style: TextStyle(color: text_color))
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


}

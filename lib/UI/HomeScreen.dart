import 'package:covidapp/API/fetch_data.dart';
import 'package:covidapp/Model/home_model.dart';
import 'package:covidapp/UI/coutriesScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../Utilities.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('COVID - 19',style: TextStyle(fontSize: 30),),centerTitle: false,),
        body: FutureBuilder<home_Model>(
          future: fetch_data_home(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // print ('data valid ');

              return Container(

                child: Column(
                  children: <Widget>[
                    //draw header
                    _draw_Container_header(),
                    _draw_Container_body(snapshot.data.affectedCountries),
                    _draw_Container_footer(
                      snapshot.data.cases,
                      snapshot.data.todayCases,
                      snapshot.data.deaths,
                      snapshot.data.today_Deaths,
                      snapshot.data.recovered,
                      snapshot.data.todayRecovered,
                      snapshot.data.active,
                      snapshot.data.critical,
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              print('error');
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  _draw_Container_header() {
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            image: DecorationImage(
                image: AssetImage('assets/images/corona1.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'COVID-19',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'take-care your family please',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              'Your life is First',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            )
          ],
        ));
  }

  _draw_Container_body(int affectedCountries) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Affected Countries : $affectedCountries',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .3,
            ),
            //   IconButton(icon: Icon(Icons.remove_red_eye),),
            IconButton(
              padding: EdgeInsets.only(right: 10),
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.blue,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>countriesScreen(),));
              },
            )
          ],
        ),
      ),
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
    return Column(
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
                    "All cases: $all_cases",
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
                    "All Deaths: $all_deaths",
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
    );
  }

  
}

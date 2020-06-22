import 'package:covidapp/Model/Countries_Model.dart';
import 'package:covidapp/Model/home_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

String Base_Url='https://corona.lmao.ninja/v2/';
Future<home_Model> fetch_data_home() async {

    final response = await http.get(Base_Url+'all');


    if (response.statusCode == 200) {
      //print('data valid');
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return home_Model.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
//------------------------------------------------------------------------------------------
Future<List<countries_Model>> fetch_data_countries() async {

  final response = await http.get(Base_Url+'countries?sort=country');

  if (response.statusCode == 200) {
    print('data valid');
    var data=json.decode(response.body);
    List<countries_Model> list=[];

    for(var item in data){
      countries_Model model =countries_Model.fromJson(item);
      list.add(model);
    }
    return list;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

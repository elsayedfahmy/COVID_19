import 'package:covidapp/API/fetch_data.dart';
import 'package:covidapp/Model/Countries_Model.dart';
import 'package:covidapp/UI/Country_Details.dart';
import 'package:flutter/material.dart';
class countriesScreen extends StatefulWidget {
  @override
  _countriesScreenState createState() => _countriesScreenState();
}

class _countriesScreenState extends State<countriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countries'),centerTitle: false,),
      body: Container(
        child: FutureBuilder<List<countries_Model>>(
          future: fetch_data_countries(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              print('data'+snapshot.data[0].active.toString());
              return ListView.builder(
                itemCount:snapshot.data.length ,
                  itemBuilder: (context, index) {
                  var snap_dat=snapshot.data[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(snap_dat.flag.toString()),
                      ),
                      title: Text(snap_dat.country),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Country_Details(snapshot.data[index]),));
                      },
                    );
                  },);
            }
            else if (snapshot.hasError) {
              print('error');
              return Text("${snapshot.error}");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      )
    );
  }
}


import 'package:app02/screens/hospitalList.dart';
import 'package:app02/screens/nepalData.dart';
import 'package:app02/screens/news.dart';
import 'package:app02/screens/worldData.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Center(
          child:
              //  Text('Corona Information',textScaleFactor: 1.5,),
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Stay',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Card(
                elevation: 2.0,
                color: Color(0xFFfe9900),
                child: Text('Home',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NepaliveData(),
            WorldData(),
            // HospitalList(),
            Card(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsCovid()),
                  );
                },
                child: ListTile(
                  leading: Image.network('https://image.flaticon.com/icons/png/512/21/21601.png',color: Colors.white,),
                  title: Text('Corona Ralated News',textScaleFactor: 1.4,),
                ),
              ),
            ),

          

          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorldData extends StatefulWidget {
  @override
  _WorldDataState createState() => _WorldDataState();
}

class _WorldDataState extends State<WorldData> {
  var wdata;
  Future getWorldUpdate() async {
    String url = 'https://data.nepalcorona.info/api/v1/world';
    var response = await http.get(url);
    var jsonData = json.decode(response.body);
    setState(() {
      wdata = jsonData;
      print(wdata);
    });
  }

  @override
  void initState() {
    super.initState();
    getWorldUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      elevation: 5,
      child: Column(
        children: <Widget>[
          Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Global Data ',
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.network('https://www.pngmart.com/files/5/World-PNG-Free-Download.png',height: 30,width: 30,),
                    ),
                  ],
                ),
          Card(
            child: Row(
              children: <Widget>[
               
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Text(wdata['active'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'Positive',
                          textScaleFactor: 1.25,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    color: Colors.green,
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Text(wdata['recovered'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'Recover',
                          textScaleFactor: 1.25,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Text(wdata['deaths'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'Deaths',
                          textScaleFactor: 1.25,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}

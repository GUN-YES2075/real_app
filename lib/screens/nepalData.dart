import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NepaliveData extends StatefulWidget {
  @override
  _NepaliveDataState createState() => _NepaliveDataState();
}

class _NepaliveDataState extends State<NepaliveData> {
  bool loading = true;
  var data;
  Future getLatestUpdate() async {
    String url = 'https://nepalcorona.info/api/v1/data/nepal';
    var response = await http.get(url);
    var jsonData = json.decode(response.body);
    setState(() {
      data = jsonData;
      print(data);
    });
  }

  @override
  void initState() {
    super.initState();
    getLatestUpdate();
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Card(
            color: Colors.orange,
            elevation: 5,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Nepal Covid Data ',
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/d/da/Flag_of_Nepal.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ],
                ),
                Card(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          color: Colors.blue.shade300,
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(data['tested_positive'].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                'Postive',
                                textScaleFactor: 1.25,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.green.shade300,
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(data['recovered'].toString(),
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
                          color: Colors.red.shade300,
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(data['in_isolation'].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                'In Isolation',
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
                Card(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          color: Colors.deepPurpleAccent,
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(data['tested_total'].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                'Total Test',
                                textScaleFactor: 1.25,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.deepPurple,
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(data['quarantined'].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                'In Quarantine',
                                textScaleFactor: 1.25,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.purple.shade300,
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(data['tested_rdt'].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                'RDT Test',
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                        'Source: ' +
                            data['latest_sit_report']['type'] +
                            ' Of Nepal',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text(
                        'Update At: ' +
                            data['latest_sit_report']['updated_at']
                                .toString()
                                .split('T')
                                .first,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          );
  }
}

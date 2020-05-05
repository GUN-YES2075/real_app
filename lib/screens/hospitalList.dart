import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {

  var hospital;
  Future<String> getHospital() async {
    String url = 'https://nepalcorona.info/api/v1/hospitals';
    var response = await http.get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});
    
    setState(() {
      var jsonData = json.decode(response.body);
      hospital = jsonData['data'];
      // print(hospital);
    });
    return 'Success';
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      this.getHospital();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
          itemCount: hospital.length,
          itemBuilder: (context, index){
           return hospital[index]['state'] == '1' ?  Column(
              children: <Widget>[
                Text(hospital[index]['name']),
                Text(hospital[index]['address']),
              ],
            ) : null;
           }  
          
      );
    
  }
}

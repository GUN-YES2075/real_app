import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class NewsCovid extends StatefulWidget {
  @override
  _NewsCovidState createState() => _NewsCovidState();
}

class _NewsCovidState extends State<NewsCovid> {

  // for News API
  var news;
  Future getNews() async {
    String url = 'https://nepalcorona.info/api/v1/news';
    var response = await http
        .get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});
    var jsonData = json.decode(response.body);
    setState(() {
      news = jsonData['data'];
      // print(news);
    });
  }

  // for launcer
  _launchURL(String website) async {
  var url = '$website';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

var loading;

Future<void> refresh() async{
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        getNews();
      });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('News About Corona'),),
     body: loading == true ? Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
            child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
          itemCount: news.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: <Widget>[
                  Image.network(news[index]['image_url']),
                  ExpansionTile(
                    title: Text(news[index]['title'],style: TextStyle(fontWeight: FontWeight.bold),),
                      children: <Widget>[
                        Text(news[index]['summary']),
                        OutlineButton(
                        onPressed: (){
                          _launchURL(news[index]['url']);
                        },
                        child: Text('Read More....'),
                        )
                      ],
                   
                  ),
                ],
              ),
            );
          }),
     ),
    );
  }
}

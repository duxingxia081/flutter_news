import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/news_detail.dart';
import 'package:flutter_news/service/service_base.dart';

class HomePage extends StatefulWidget {
  String tab;

  HomePage(this.tab);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(widget.tab),
        builder: (context, response) {
          if (response.hasData) {
            String dataStr = response.data.toString();
            dataStr = dataStr.substring(9, dataStr.length - 1);
            var data = json.decode(dataStr);
            List<Map> newsList = (data[widget.tab] as List).cast();
            return ListView(
              children: newsList.map((e) => news(context,e)).toList(),
            );
          } else {
            return Center(
              child: Text('加载中...'),
            );
          }
        });
  }
}

Widget news(context, data) {
  return InkWell(
      onTap: () {
        if (null == data['url'] || "" == data['url']) {
          return;
        } else {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NewsDetail(data['url'])));
        }
      },
      child: Container(
          margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
          constraints: BoxConstraints(maxHeight: 80.0),
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text(data['title']),
                  subtitle: Text(data['ptime']),
                ),
                flex: 2,
              ),
              Expanded(
                child: Container(
                  child: Image.network(data['imgsrc']),
                ),
                flex: 1,
              )
            ],
          )));
}

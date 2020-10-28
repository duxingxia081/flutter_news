import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    print(widget.tab);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(widget.tab),
        builder: (context, response) {
          if (response.hasData) {
            var data = json.decode(response.data);
            if (null!=data['reason']) {
              return Center(
                child: Text(data['reason']),
              );
            }
            List<Map> newsList = (data['result']['data'] as List).cast();
            return ListView(
              children: newsList.map((e) => news(e)).toList(),
            );
          } else {
            return Center(
              child: Text('加载中...'),
            );
          }
        });
  }
}

Widget news(data) {
  return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: Row(
        children: [
          Expanded(
            child: Text(data['title']),
            flex: 2,
          ),
          Expanded(
            child: Container(
              child: Image.network(data['thumbnail_pic_s']),
            ),
            flex: 1,
          )
        ],
      ));
}

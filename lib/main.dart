import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/home_page.dart';
import 'package:flutter_news/service/service_base.dart';

void main() {
  runApp(MaterialApp(
    title: '新闻综合',
    home: FlutterNews(),
  ));
}

class FlutterNews extends StatefulWidget {
  @override
  _FlutterNewsState createState() => _FlutterNewsState();
}

class _FlutterNewsState extends State<FlutterNews>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  var _tabController;
  var _newTab = <NewsTab>[
    NewsTab("新闻", "BBM54PGAwangning"),
    NewsTab("娱乐", "BA10TA81wangning"),
    NewsTab("体育", "BA8E6OEOwangning"),
    NewsTab("财经", "BA8EE5GMwangning"),
    NewsTab("军事", "BAI67OGGwangning"),
    NewsTab("科技", "BA8D4A3Rwangning"),
    NewsTab("手机", "BAI6I0O5wangning"),
    NewsTab("数码", "BAI6JOD9wangning"),
    NewsTab("时尚", "BA8F6ICNwangning"),
    NewsTab("游戏", "BAI6RHDKwangning"),
    NewsTab("教育", "BA8FF5PRwangning"),
    NewsTab("健康", "BDC4QSV3wangning"),
    NewsTab("旅游", "BEO4GINLwangning")
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _newTab.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('新闻资讯'),
          bottom: TabBar(
            tabs: _newTab.map((newTab) => Tab(text: newTab.text)).toList(),
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Color(0xffff0000),
          )),
      body: TabBarView(
        controller: _tabController,
        children: _newTab
            .map((NewsTab newTab) => Container(child: HomePage(newTab.label)))
            .toList(),
      ),
      /* floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/

      /*drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('userName'),
              accountEmail: Text('admin@email.com'),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://p0.ssl.qhimgs1.com/sdr/400__/t01b3bc142b70ef7e0e.jpg')),
            ),
            ListTile(
              title: Text('标题1'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              title: Text('标题2'),
            ),
            Divider(),
            ListTile(
              title: Text('标题3'),
            ),
            ListTile(
              title: Text('标题4'),
            )
          ],
        ),
      ),*/
    );
  }
}

class NewsTab {
  String text;
  String label;

  NewsTab(this.text, this.label);
}

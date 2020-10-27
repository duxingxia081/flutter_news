import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/home_page.dart';

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

  var _tabs = <Tab>[
    Tab(
      text: "头条",
    ),
    Tab(
      text: "社会",
    ),
    Tab(
      text: "国内",
    ),
    Tab(
      text: "国际",
    ),
    Tab(
      text: "娱乐",
    ),
    Tab(
      text: "体育",
    ),
    Tab(
      text: "军事",
    ),
    Tab(
      text: "科技",
    ),
    Tab(
      text: "财经",
    ),
    Tab(
      text: "时尚",
    )
  ];
  List children = [HomePage(), HomePage()];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
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
            tabs: _tabs,
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Color(0xffff0000),
          )),
      body: TabBarView(
        controller: _tabController,
        children: _tabs
            .map((Tab tab) => Container(
                  child: Center(
                    child: Text(tab.text),
                  ),
                ))
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

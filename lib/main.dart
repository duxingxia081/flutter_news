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

class _FlutterNewsState extends State<FlutterNews> {
  int _currentIndex = 0;
  List children = [HomePage(), HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('新闻资讯')),
      body: children[_currentIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.water_damage), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: '我的')
        ],
      ),
      drawer: Drawer(
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
      ),
    );
  }
}

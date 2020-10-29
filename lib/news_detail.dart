import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_news/service/service_base.dart';

class NewsDetail extends StatelessWidget {
  var url;

  NewsDetail(this.url);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDetail(url),
        builder: (context, response) {
          if (response.hasData) {
            return SingleChildScrollView(
                child: Html(
              data: response.data,
            ));
          } else {
            return Center(
              child: Text('加载中...'),
            );
          }
        });
  }
}

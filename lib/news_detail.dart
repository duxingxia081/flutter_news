import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_news/service/service_base.dart';
import 'package:html/parser.dart' show parse;

class NewsDetail extends StatelessWidget {
  var url;
  var title;
  var content;

  NewsDetail(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('新闻详情'),
        ),
        body: FutureBuilder(
            future: getDetail(url),
            builder: (context, response) {
              if (response.hasData) {
                print(url);
                gethttp(response.data);
                return SingleChildScrollView(
                    child: Html(data: response.data,));
              } else {
                return Center(
                  child: Text('加载中...'),
                );
              }
            }));
  }

  void gethttp(String html) {
    //解析返回的数据，类似 val doc = Jsoup.connect(text).get()

    var document = parse(html);

    //获取html标签，类似val links = doc.select("title")
    title = document.querySelector("title").text;
    content = document.getElementsByTagName("main")[0].text;
    /*print(title);
    print(document.getElementsByClassName("title")[0].text);
    print(document.getElementsByClassName("js-time")[0].text);
    print(document.getElementsByClassName("js-source")[0].text);*/
    //获取html body标签，类似 val body = doc.getElementsByTag("body")
    var body = document.getElementsByTagName("body");
    //下面获取html的图片，暂未找到好的解决办法，使用的最笨的截取
    var scripts = body[0].getElementsByTagName("script");
    for (int i = 0; i < scripts.length; i++) {
      //将获取的html标签转换成String字符串
      var script = scripts[i].outerHtml.toString();
      //判断字符串是否包含BASE_DATA
      if (script.indexOf("BASE_DATA") != -1) {
        //处理得到image图片
        var image = script
            .substring(
                script.indexOf("coverImg"), script.indexOf("commentInfo:"))
            .replaceAll("coverImg:", "")
            .replaceAll("\'", "")
            .replaceAll("},", "");
        print(image);
      }
    }
  }

  static void p(String msg) {
    //因为String的length是字符数量不是字节数量所以为了防止中文字符过多，
    //  把4*1024的MAX字节打印长度改为1000字符数
    int maxStrLength = 1000;
    //大于1000时
    while (msg.length > maxStrLength) {
      print(msg.substring(0, maxStrLength));
      msg = msg.substring(maxStrLength);
    }
    //剩余部分
    print(msg);
  }
}

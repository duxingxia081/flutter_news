import 'package:dio/dio.dart';
import 'package:flutter_news/config/constants.dart';

Future getData(type) async {
  try {
    Dio dio = Dio();
    dio.options.responseType = ResponseType.plain;
    var url = serviceUrl+"?key="+key+"&type="+type;
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('获取后段数据异常：' + response.statusCode.toString());
    }
  } catch (e) {
    print('接口异常' + e);
  }
}

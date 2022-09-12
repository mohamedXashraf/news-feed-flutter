import 'package:dio/dio.dart';
import 'package:news_feed/data/model/news.dart';
import 'package:news_feed/data/api/response.dart';
const _baseUrl = "https://newsapi.org/v1/";
const _apiKey = "91da53ae90924e6981690f1c3128ef89";

Future<List<News>?> get(String source) async {
  var url = "${_baseUrl}articles?source=$source&apiKey=$_apiKey";
  try {
    var response = await Dio().get(url);
    print(response.data.toString());
    return NewsResponse.fromJson(response.data).articles;
  } catch (e) {
    print(e);
    return [];
  }
}
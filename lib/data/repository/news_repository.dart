import 'package:news_feed/data/model/news.dart';
import 'package:news_feed/data/api/news_apis.dart' as newsAPIs;
import '../model/news.dart';

class NewsRepository {

  Future<List<News>?> getNextWebArticles() async => newsAPIs.get("the-next-web");

  Future<List<News>?> getAssociatedPressArticles() async => newsAPIs.get("associated-press");
}
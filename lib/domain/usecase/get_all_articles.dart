import 'package:news_feed/data/repository/news_repository.dart';
import '../../data/model/news.dart';

final _repository = NewsRepository();

Future<List<News>> getAllArticles() async {
  List<News> articles = [];
  articles.addAll(await _repository.getNextWebArticles() ?? []);
  articles.addAll(await _repository.getAssociatedPressArticles() ?? []);
  return articles;
}
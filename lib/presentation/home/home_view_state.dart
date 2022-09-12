import '../../data/model/news.dart';

class HomeViewState { }

class NewsDataState extends HomeViewState {
  List<News>? articles;
  NewsDataState(this.articles);
}

class ErrorState extends HomeViewState {
  String error = "";
  ErrorState(this.error);
}
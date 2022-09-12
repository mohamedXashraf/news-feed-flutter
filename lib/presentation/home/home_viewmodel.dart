import '../base/ViewModel.dart';
import 'home_view_intent.dart';
import 'home_view_state.dart';
import '../../domain/usecase/get_all_articles.dart' as usecase;

class HomeViewModel extends ViewModel<HomeViewIntent, HomeViewState> {

  HomeViewModel() {
    intents((intent) {
      switch (intent.runtimeType){
        case GetNewsFeedIntent:{
          _getNewsFeed();
        }
        break;
      }
    });
  }

  void _getNewsFeed() async {
    var articles = await usecase.getAllArticles();
    publish(NewsDataState(articles));
  }
}
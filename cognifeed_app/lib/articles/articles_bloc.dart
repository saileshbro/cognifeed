import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/articles/articles_event.dart';
import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';
import 'package:cognifeed_app/articles/articles_state.dart';

class ArticlesBloc extends Bloc<ArticleEvent, ArticlesState> {
  @override
  ArticlesState get initialState => ArticlesInitialState();

  @override
  Stream<ArticlesState> mapEventToState(
    ArticleEvent event,
  ) async* {
    yield ArticlesLoadingState();
    try {
      if (event is GetHomePageArticlesEvent) {
        ArticlesModel response = await ArticleRepository.getHomePageArticles(
          query: "",
          searchby: "",
        );
        yield ArticlesLoadedState(articlesModel: response);
      }
      if (event is GetFavPageArticlesEvent) {
        ArticlesModel response = await ArticleRepository.getFavPageArticles(
          query: "",
          searchby: "",
        );
        yield ArticlesLoadedState(articlesModel: response);
      }
      if (event is GetHiddenPageArticlesEvent) {
        ArticlesModel response = await ArticleRepository.getHiddenPageArticles(
          query: "",
          searchby: "",
        );
        yield ArticlesLoadedState(articlesModel: response);
      }
    } catch (e) {
      yield ArticlesErrorState(e.toString());
    }
  }
}

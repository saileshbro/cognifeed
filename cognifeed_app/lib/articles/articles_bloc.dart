import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/articles/articles_event.dart';
import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';
import 'package:cognifeed_app/articles/articles_state.dart';

class ArticlesBloc extends Bloc<ArticleEvent, ArticlesState> {
  @override
  ArticlesState get initialState => ArticlesInitialState();
  ArticlesModel response;
  @override
  Stream<ArticlesState> mapEventToState(
    ArticleEvent event,
  ) async* {
    try {
      if (event is GetHomePageArticlesEvent) {
        yield ArticlesLoadingState();
        response = await ArticleRepository.getHomePageArticles(
            query: "", searchby: "", pageNo: 1);
        yield ArticlesLoadedState(articlesModel: response);
      }
      if (event is PaginateHomePage) {
        yield ArticlesPaginatingState();
        ArticlesModel newArticles = await ArticleRepository.getHomePageArticles(
          query: "",
          searchby: "",
          pageNo: event.pageNo,
        );
        response.articles.addAll(newArticles.articles);
        yield ArticlesPaginatedState(articlesModel: response);
      }
    } catch (e) {
      yield ArticlesErrorState(e.toString());
    }
  }
}

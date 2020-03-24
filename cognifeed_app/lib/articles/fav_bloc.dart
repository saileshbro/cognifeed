import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';
import 'package:cognifeed_app/articles/fav_event.dart';
import 'package:cognifeed_app/articles/fav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavArticlesBloc extends Bloc<ArticleEvent, FavArticlesState> {
  @override
  FavArticlesState get initialState => FavArticlesInitialState();
  ArticlesModel response;
  @override
  Stream<FavArticlesState> mapEventToState(
    ArticleEvent event,
  ) async* {
    try {
      if (event is GetFavPageArticlesEvent) {
        yield FavArticlesLoadingState();
        response = await ArticleRepository.getFavPageArticles(
            query: "", searchby: "", pageNo: 1);
        yield FavArticlesLoadedState(articlesModel: response);
      }
      if (event is PaginateFavPage) {
        yield FavArticlesPaginatingState();
        ArticlesModel newFavArticles =
            await ArticleRepository.getFavPageArticles(
          query: "",
          searchby: "",
          pageNo: event.pageNo,
        );
        response.articles.addAll(newFavArticles.articles);
        yield FavArticlesPaginatedState(articlesModel: response);
      }
    } catch (e) {
      yield ArticlesErrorState(e.toString());
    }
  }
}

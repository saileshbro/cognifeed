import 'package:cognifeed_app/articles/all_articles_event.dart';
import 'package:cognifeed_app/articles/all_articles_state.dart';
import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AllArticlesBloc extends Bloc<ArticleEvent, AllArticlesState> {
  @override
  AllArticlesState get initialState => AllArticlesInitialState();
  ArticlesModel response;
  @override
  Stream<AllArticlesState> mapEventToState(
    ArticleEvent event,
  ) async* {
    try {
      if (event is GetAllArticlesPageArticlesEvent) {
        yield AllArticlesLoadingState();
        response = await ArticleRepository.getAllPageArticles(
            query: "", searchby: "", pageNo: 1);
        yield AllArticlesLoadedState(articlesModel: response);
      }
      if (event is PaginateAllPage) {
        yield AllArticlesPaginatingState();
        ArticlesModel newAllArticles =
            await ArticleRepository.getAllPageArticles(
          query: "",
          searchby: "",
          pageNo: event.pageNo,
        );
        response.articles.addAll(newAllArticles.articles);
        yield AllArticlesPaginatedState(articlesModel: response);
      }
    } catch (e) {
      yield ArticlesErrorState(e.toString());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';

import 'all_articles_event.dart';
import 'all_articles_state.dart';

class AllArticlesBloc extends Bloc<ArticleEvent, AllArticlesState> {
  @override
  AllArticlesState get initialState => AllArticlesInitialState();

  @override
  Stream<AllArticlesState> mapEventToState(
    ArticleEvent event,
  ) async* {
    yield AllArticlesLoadingState();
    try {
      if (event is GetAllArticlesPageArticlesEvent) {
        ArticlesModel response = await ArticleRepository.getAllPageArticles(
          query: "",
          searchby: "",
        );
        yield AllArticlesLoadedState(articlesModel: response);
      }
    } catch (e) {
      yield ArticlesErrorState(e.toString());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';
import 'package:cognifeed_app/articles/hide_event.dart';
import 'package:cognifeed_app/articles/hide_state.dart';

class HideArticlesBloc extends Bloc<ArticleEvent, HideArticlesState> {
  @override
  HideArticlesState get initialState => HideArticlesInitialState();
  ArticlesModel response;
  @override
  Stream<HideArticlesState> mapEventToState(
    ArticleEvent event,
  ) async* {
    try {
      if (event is GetHiddenPageArticlesEvent) {
        yield HideArticlesLoadingState();
        response = await ArticleRepository.getHiddenPageArticles(
            query: "", searchby: "", pageNo: 1);
        yield HideArticlesLoadedState(articlesModel: response);
      }
      if (event is PaginateHiddenPage) {
        yield HidePaginatingState();
        ArticlesModel newHide = await ArticleRepository.getHiddenPageArticles(
          query: "",
          searchby: "",
          pageNo: event.pageNo,
        );
        response.articles.addAll(newHide.articles);
        yield HidePaginateLoadedState(articlesModel: response);
      }
    } catch (e) {
      yield HideArticlesErrorState(e.toString());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/articles/hide_event.dart';
import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';
import 'package:cognifeed_app/articles/hide_state.dart';

class HideArticlesBloc extends Bloc<ArticleEvent, HideArticlesState> {
  @override
  HideArticlesState get initialState => HideArticlesInitialState();

  @override
  Stream<HideArticlesState> mapEventToState(
    ArticleEvent event,
  ) async* {
    yield HideArticlesLoadingState();
    try {
      if (event is GetHiddenPageArticlesEvent) {
        ArticlesModel response = await ArticleRepository.getHiddenPageArticles(
          query: "",
          searchby: "",
        );
        yield HideArticlesLoadedState(articlesModel: response);
      }
    } catch (e) {
      yield HideArticlesErrorState(e.toString());
    }
  }
}

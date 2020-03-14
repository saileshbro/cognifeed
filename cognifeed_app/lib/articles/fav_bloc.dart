import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/articles/fav_event.dart';
import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:cognifeed_app/articles/articles_repository.dart';
import 'package:cognifeed_app/articles/fav_state.dart';

class FavArticlesBloc extends Bloc<ArticleEvent, FavArticlesState> {
  @override
  FavArticlesState get initialState => FavArticlesInitialState();

  @override
  Stream<FavArticlesState> mapEventToState(
    ArticleEvent event,
  ) async* {
    yield FavArticlesLoadingState();
    try {
      if (event is GetFavPageArticlesEvent) {
        ArticlesModel response = await ArticleRepository.getFavPageArticles(
          query: "",
          searchby: "",
        );
        yield FavArticlesLoadedState(articlesModel: response);
      }
    } catch (e) {
      yield ArticlesErrorState(e.toString());
    }
  }
}

import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:meta/meta.dart';

abstract class FavArticlesState {}

class FavArticlesLoadingState extends FavArticlesState {}

class FavArticlesInitialState extends FavArticlesState {}

class FavArticlesLoadedState extends FavArticlesState {
  final ArticlesModel articlesModel;

  FavArticlesLoadedState({@required this.articlesModel});
}

class ArticlesErrorState extends FavArticlesState {
  final String error;

  ArticlesErrorState(this.error);
}

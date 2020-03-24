import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:meta/meta.dart';

abstract class ArticlesState {}

class ArticlesLoadingState extends ArticlesState {}

class ArticlesPaginatingState extends ArticlesState {}

class ArticlesInitialState extends ArticlesState {}

class ArticlesLoadedState extends ArticlesState {
  final ArticlesModel articlesModel;

  ArticlesLoadedState({@required this.articlesModel});
}

class ArticlesPaginatedState extends ArticlesState {
  final ArticlesModel articlesModel;

  ArticlesPaginatedState({@required this.articlesModel});
}

class ArticlesErrorState extends ArticlesState {
  final String error;

  ArticlesErrorState(this.error);
}

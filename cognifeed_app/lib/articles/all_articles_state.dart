import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:meta/meta.dart';

abstract class AllArticlesState {}

class AllArticlesLoadingState extends AllArticlesState {}

class AllArticlesPaginatingState extends AllArticlesState {}

class AllArticlesInitialState extends AllArticlesState {}

class AllArticlesLoadedState extends AllArticlesState {
  final ArticlesModel articlesModel;

  AllArticlesLoadedState({@required this.articlesModel});
}

class AllArticlesPaginatedState extends AllArticlesState {
  final ArticlesModel articlesModel;

  AllArticlesPaginatedState({@required this.articlesModel});
}

class ArticlesErrorState extends AllArticlesState {
  final String error;

  ArticlesErrorState(this.error);
}

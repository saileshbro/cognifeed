import 'package:cognifeed_app/articles/articles_model.dart';
import 'package:meta/meta.dart';

abstract class HideArticlesState {}

class HideArticlesLoadingState extends HideArticlesState {}

class HideArticlesInitialState extends HideArticlesState {}

class HideArticlesLoadedState extends HideArticlesState {
  final ArticlesModel articlesModel;

  HideArticlesLoadedState({@required this.articlesModel});
}

class HideArticlesErrorState extends HideArticlesState {
  final String error;

  HideArticlesErrorState(this.error);
}

import 'package:meta/meta.dart';

abstract class ArticleEvent {}

class GetHomePageArticlesEvent extends ArticleEvent {}

class PaginateHomePage extends ArticleEvent {
  final int pageNo;

  PaginateHomePage({@required this.pageNo});
}

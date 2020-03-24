abstract class ArticleEvent {}

class GetAllArticlesPageArticlesEvent extends ArticleEvent {}

class PaginateAllPage extends ArticleEvent {
  final int pageNo;

  PaginateAllPage(this.pageNo);
}

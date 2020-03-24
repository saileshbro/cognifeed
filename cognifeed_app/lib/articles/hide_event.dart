abstract class ArticleEvent {}

class GetHiddenPageArticlesEvent extends ArticleEvent {}

class PaginateHiddenPage extends ArticleEvent {
  final int pageNo;

  PaginateHiddenPage(this.pageNo);
}

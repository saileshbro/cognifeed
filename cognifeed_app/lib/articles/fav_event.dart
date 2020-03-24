abstract class ArticleEvent {}

class GetFavPageArticlesEvent extends ArticleEvent {}

class PaginateFavPage extends ArticleEvent {
  final int pageNo;

  PaginateFavPage(this.pageNo);
}

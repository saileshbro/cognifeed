import 'package:cognifeed_app/articles/articles_model.dart';

abstract class FavEvent {}

class AddToFavEvent extends FavEvent {
  final Article article;

  AddToFavEvent(this.article);
}

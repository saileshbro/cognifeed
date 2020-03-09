import 'package:bloc/bloc.dart';
import 'package:cognifeed_app/fav/fav_event.dart';
import 'package:cognifeed_app/fav/fav_repository.dart';

import 'fav_state.dart';

class FavBloc extends Bloc<FavEvent, FavState> {
  @override
  FavState get initialState => FavInitialState();

  @override
  Stream<FavState> mapEventToState(
    FavEvent event,
  ) async* {
    yield FavLoadingState();
    try {
      if (event is AddToFavEvent) {
        final message = await FavRepository.addToFav(
            articleId: event.article.articleId.toString());
        yield FavSuccessState(message);
      }
    } catch (e) {
      yield FavErrorState(e.toString());
    }
  }
}
